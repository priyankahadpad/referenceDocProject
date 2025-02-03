import 'package:demoproject/Commons/SizedBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.validator,
    this.validationMessage,
    this.textEditingController,
    this.hintText,
    this.leadingIcon,
    this.prefixIconColor = const Color(0xFF737373),
    this.isInputPassword = false,
    this.value,
    this.readonly = false,
    this.enabled = true,
    this.outlineColor = Colors.black,
    this.maxlines = 1,
    this.texttype,
    this.inputFormatters,
    this.onInput,
    this.onTap,
    this.suffixIcon,
    this.opacity1 = 0.04,
    this.opacity2 = 0.05,
    this.focusNode,
  }) : super(key: key);

  dynamic validator;
  final TextEditingController? textEditingController;
  final String? hintText;
  final Widget? leadingIcon;
  final Color prefixIconColor;
  final bool isInputPassword;
  final String? value;
  final bool readonly;
  final bool enabled;
  final int maxlines;
  final TextInputType? texttype;
  final List<TextInputFormatter>? inputFormatters;
  final Color outlineColor;
  final String? Function(String?)? onInput;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final double opacity1;
  final double opacity2;
  final FocusNode? focusNode;
  String? validationMessage;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isInputPassword;
  }

  void validateField(String value) {
    setState(() {
      widget.validationMessage =
          widget.validator?.call(value) ?? (value.isEmpty ? "" : null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlassContainer(
          height: 52.h,
          width: double.infinity,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(widget.opacity1),
                const Color(0xFFFFFFFF).withOpacity(widget.opacity1),
              ],
              stops: const [
                0.1,
                1,
              ]),
          blur: 6,
          opacity: 1,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: const Color(0xff434A53), width: 0.8),
          child: TextFormField(
            focusNode: widget.focusNode,
            style: TextStyle(
                fontSize: 16.sp, color: Colors.white, fontFamily: 'Helvetica'),
            cursorColor: Colors.red,
            initialValue: widget.value,
            readOnly: widget.readonly,
            onTap: widget.onTap,
            enabled: widget.enabled,
            enableInteractiveSelection: true,
            maxLines: widget.maxlines,
            obscureText: obscureText,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIconColor: widget.prefixIconColor,
              constraints: const BoxConstraints(minHeight: 50),
              hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromARGB(255, 130, 128, 128),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Helvetica'),
              prefixIcon: widget.leadingIcon == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 13.h),
                      child: widget.leadingIcon!,
                    ),
              suffixIcon: widget.isInputPassword
                  ? GestureDetector(
                      onTap: () => setState(() => obscureText = !obscureText),
                      child: obscureText
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: 
                                  SvgPicture.asset(
                                    "assets/images/svg/loginpasswordclose.svg",
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: SvgPicture.asset(
                                    'assets/images/svg/loginpasswordopen.svg',
                                  ),
                                ),
                              ],
                            ),
                    )
                  : widget.suffixIcon,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.h, vertical: 13.w),
            ),
            keyboardType: widget.texttype,
            inputFormatters: widget.inputFormatters,
            // validator: widget.validator,
            onChanged: (value) {
              widget.onInput?.call(value);
              validateField(value);
            },
          ),
        ),
        sizedBoxHeight(5.h),
        widget.validationMessage == null
            ? const SizedBox()
            : Text(
                widget.validationMessage ?? '',
                style: TextStyle(color: Colors.red, fontSize: 12.sp),
                overflow: TextOverflow.ellipsis,
              ),
      ],
    );
  }
}
