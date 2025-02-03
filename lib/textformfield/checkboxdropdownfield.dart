import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownChexkBox extends StatefulWidget {
  const CustomDropDownChexkBox({
    Key? key,
    required this.header,
    required this.title,
    required this.listData,
    required this.onItemSelected,
    this.leadingImage,
    this.showOtherOption = false,
    required this.initiallySelected, // Added this line
  }) : super(key: key);

  final String header;
  final String title;
  final List<String> listData;
  final Function(List<String>) onItemSelected;
  final Widget? leadingImage;
  final bool showOtherOption;
  final List<String> initiallySelected; // Added this line

  @override
  State<CustomDropDownChexkBox> createState() => _CustomDropDownChexkBoxState();
}

class _CustomDropDownChexkBoxState extends State<CustomDropDownChexkBox> {
  RxBool onDropTap = false.obs;
  RxList<String> selectedValues = <String>[].obs;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedValues.addAll(widget.initiallySelected); // Added this line
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
            if (selectedValues.contains(item)) {
              selectedValues.remove(item);
            } else {
              selectedValues.add(item);
            }
            _textController.clear();
            widget.onItemSelected(selectedValues);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Obx(() {
                    return Checkbox(
                      value: selectedValues.contains(item),
                      activeColor: Colors.white,
                      checkColor: const Color(0xFFD90B2E),
                      onChanged: (bool? value) {
                        if (value == true) {
                          selectedValues.add(item);
                        } else {
                          selectedValues.remove(item);
                        }
                        _textController.clear();
                        widget.onItemSelected(selectedValues);
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
                    return Checkbox(
                      value: selectedValues.contains(_textController.text),
                      activeColor: Colors.white,
                      onChanged: (bool? value) {
                        if (value == true &&
                            _textController.text.trim().isNotEmpty) {
                          selectedValues.add(_textController.text);
                        } else {
                          selectedValues.remove(_textController.text);
                        }
                        widget.onItemSelected(selectedValues);
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
                        selectedValues.add(_textController.text);
                        widget.onItemSelected(selectedValues);
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
              const SizedBox(height: 10),
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
              onDropTap.value = !onDropTap.value;
            },
            child: Container(
              width: double.infinity,
              // height: 50,
              padding: const EdgeInsets.only(
                  right: 22, left: 12, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF).withOpacity(0.10),
                borderRadius: onDropTap.value
                    ? const BorderRadius.vertical(
                        top: Radius.circular(30),
                      )
                    : const BorderRadius.all(Radius.circular(30)),
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
                    widget.leadingImage == null
                        ? const SizedBox()
                        : widget.leadingImage!,
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        selectedValues.isEmpty
                            ? widget.header
                            : selectedValues.join(', '),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w400,
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // const Spacer(),
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
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30),
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
