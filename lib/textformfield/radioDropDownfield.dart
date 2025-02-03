import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropDownRadio extends StatefulWidget {
  const CustomDropDownRadio({
    Key? key,
    required this.header,
    required this.title,
    required this.listData,
    required this.onItemSelected,
    required this.leadingImage,
    this.showOtherOption = false,
    this.initialSelectedValue = '',
  }) : super(key: key);

  final String header;
  final String title;
  final List<String> listData;
  final Function(String) onItemSelected;
  final Widget? leadingImage;
  final bool showOtherOption;
  final String initialSelectedValue;

  @override
  State<CustomDropDownRadio> createState() => _CustomDropDownRadioState();
}

class _CustomDropDownRadioState extends State<CustomDropDownRadio> {
  RxBool onDropTap = false.obs;
  RxString selectedValue = ''.obs;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedValue.value = widget.initialSelectedValue;
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    List<DropdownMenuItem<String>> items =
        widget.listData.asMap().entries.map((entry) {
      int index = entry.key;
      String item = entry.value;
      return DropdownMenuItem<String>(
        value: item,
        child: InkWell(
          onTap: () {
            setState(() {
              selectedValue.value = item;
              _textController.clear();
              widget.onItemSelected(item);
              onDropTap.value = false; // Close the dropdown
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Obx(() {
                    return Radio<String>(
                      value: item,
                      activeColor: Colors.white,
                      groupValue: selectedValue.value,
                      onChanged: (value) {
                        setState(() {
                          selectedValue.value = value!;
                          _textController.clear();
                          widget.onItemSelected(value);
                          onDropTap.value = false; // Close the dropdown
                        });
                      },
                    );
                  }),
                  const SizedBox(width: 8),
                  Text(
                    item,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              if (index != widget.listData.length - 1)
                const Divider(thickness: 1, color: Color(0xFF434A53)),
            ],
          ),
        ),
      );
    }).toList();

    if (widget.showOtherOption) {
      items.add(
        DropdownMenuItem<String>(
          value: _textController.text,
          child: Column(
            children: [
              const Divider(thickness: 1, color: Color(0xFF434A53)),
              Row(
                children: [
                  Obx(() {
                    return Radio<String>(
                      value: _textController.text,
                      activeColor: Colors.white,
                      groupValue: selectedValue.value,
                      onChanged: (value) {
                        setState(() {
                          selectedValue.value = value!;
                          _textController.clear();
                          widget.onItemSelected(value);
                          onDropTap.value = false; // Close the dropdown
                        });
                      },
                    );
                  }),
                  const SizedBox(width: 8),
                  const Text(
                    "Other: ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: const InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_textController.text.trim().isNotEmpty) {
                        setState(() {
                          selectedValue.value = _textController.text;
                          widget.onItemSelected(_textController.text);
                          onDropTap.value = false; // Close the dropdown
                        });
                      }
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                onDropTap.value = !onDropTap.value;
              });
            },
            child: Container(
              width: double.infinity,
              height: 52.h,
              padding: EdgeInsets.only(
                right: 22.w,
                left: 12.w,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF).withOpacity(0.10),
                borderRadius: onDropTap.value
                    ? BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      )
                    : BorderRadius.circular(30.r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.50),
                    const Color(0xFFFFFFFF).withOpacity(0.50),
                  ],
                ),
                border: Border.all(color: const Color(0xFF434A53)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.leadingImage!,
                    SizedBox(width: 12.w),
                    Text(
                      selectedValue.value.isEmpty
                          ? widget.header
                          : selectedValue.value,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    onDropTap.value
                        ? Image.asset('assets/images/png/arrowup.png')
                        : Image.asset('assets/images/png/arrowdown.png'),
                  ],
                ),
              ),
            ),
          ),
          if (onDropTap.value)
            Scrollbar(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF).withOpacity(0.10),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30.r),
                  ),
                  border: Border.all(color: const Color(0xFF434A53)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.50),
                      const Color(0xFFFFFFFF).withOpacity(0.50),
                    ],
                  ),
                ),
                child: Column(
                  children: _buildDropdownMenuItems(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

