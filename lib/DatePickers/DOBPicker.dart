import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateOfBirthPicker extends StatelessWidget {
  final RxString dob;
  DateOfBirthPicker(this.dob);
  final dateFormat = DateFormat('dd MMMM yyyy');

  Future<void> datePicker(
    BuildContext context, TextEditingController controller) async {
  final ThemeData customTheme = Theme.of(context).copyWith(
      colorScheme: const ColorScheme.light(
          primary: Color(0xFFD90B2E),
          surfaceTint: Color(0xFF222935),
          surface: Color(0xFF222935),
          onPrimary: Colors.white,
          onSurface: Colors.white,
          onSecondary: Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFD90B2E),
        ),
      ));
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: customTheme,
        child: child!,
      );
    },
  );

  if (picked != null) {
    controller.text = DateFormat('yyyy-MM-dd').format(picked);
  }
}

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          InkWell(
            onTap: () async {
              print(dob.value);
              DateFormat formatter = DateFormat('dd MMMM yyyy');
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: dob.value.isNotEmpty
                    ? formatter.parse(dob.value)
                    : DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: Color(0xFF3192D8), // Change primary color
                        onPrimary: Colors.black, // Change text color
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              Colors.black, // Change button text color
                        ),
                      ),
                      dialogBackgroundColor:
                          Colors.yellow, // Change dialog background color
                    ),
                    child: child!,
                  );
                },
              );
              if (selectedDate != null) {
                dob.value = dateFormat.format(selectedDate);
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                autovalidateMode: (dob.value != '')
                    ? AutovalidateMode.always
                    : AutovalidateMode.onUserInteraction,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito Sans',
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 20,
                  ),
                  hintText: dob.value.isNotEmpty
                      ? dob.toString()
                      : 'Pick your birthdate',
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: Color(0xFFDBDBDB), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: Color(0xFFDBDBDB), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: Color(0xFFDBDBDB), width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                  ),
                ),
                validator: (val) {
                  if (dob.value.isEmpty) {
                    return 'Please select your date';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
