 import 'package:demoproject/Commons/SizedBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void _unlockbottomsheet() {
    Get.bottomSheet(
      Container(
      child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              children: [
                sizedBoxHeight(50.h),
                // Image.asset(
                //   'assets/images/png/Group 1000003722.png',
                //   height: 100.h,
                // ),
                // sizedBoxHeight(25.h),
                Text('Please subscribed to unlock'),
                sizedBoxHeight(30.h),
                // CommonBtn(
                //   text: 'Subscribe Now',
                //   onTap: () {},
                // ),

                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.3),
    );
  }