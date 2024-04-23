import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color backgroundColor;
  final double width;
  final double height;
  final double fontSize;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFEEBA2B),
    this.width = double.infinity,
    this.height = 45.0,
    this.fontSize = 16.0,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(width, height),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "DM Sans",
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
