// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(height!);
  const CommonAppbar(
      {Key? key,
      required this.titleTxt,
      this.suffixIcon,
      this.showLeading = true,
      this.customBack,
      this.backPageName = '',
      this.customActionWidget,
      this.onCustomActionPressed,
      this.height = 105})
      : super(key: key);

  final String titleTxt;
  final String? suffixIcon;
  final bool? showLeading;
  final bool? customBack;
  final String? backPageName;
  final Widget? customActionWidget;
  final VoidCallback? onCustomActionPressed;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height ?? 130),
      child: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.black,
        elevation: 0,
        leadingWidth: 56,
        leading: Padding(
          padding: EdgeInsets.only(left: 16, top: 20),
          child: GestureDetector(
            onTap: () {
              customBack ?? false ? Get.toNamed(backPageName!) : Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: EdgeInsets.all(0),
          title: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titleTxt,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'manrope'),
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ],
                ),

                // newTextfield(
                //     FontWeight.w400, 0)
              ],
            ),
          ),
        ),
        actions: [
          //   if (calendarWidget == true)
          //     InkWell(
          //       onTap: onCustomActionPressed,
          //       child: Padding(
          //         padding: EdgeInsets.only(right: 14.w),
          //         child: Icon(
          //           Icons.calendar_month_outlined,
          //           color: Color(0xFF3192D8),
          //           size: 28,
          //         ),
          //       ),
          //     ),
          if (customActionWidget != null)
            InkWell(
              onTap: onCustomActionPressed,
              child: Padding(
                padding: EdgeInsets.only(right: 14),
                child: customActionWidget,
              ),
            ),
        ],
      ),
    );
  }
}
