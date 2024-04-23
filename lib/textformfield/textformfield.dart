import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.validator,
    this.inputFormatters,
    required this.hintText,
    required this.validatorText,
    this.textEditingController,
    this.leadingIcon,
    this.readonly = false,
    this.textCapital = false,
    this.isInputPassword = false,
    this.outlineColor = const Color(0xFFFFB600),
    this.texttype,
    this.onInput,
    this.onTap,
    this.maxlines = 1,
  }) : super(key: key);

  dynamic validator;
  final TextEditingController? textEditingController;
  final String hintText;
  final String validatorText;
  final Widget? leadingIcon;
  final bool isInputPassword;
  final bool readonly;
  final bool textCapital;
  final dynamic inputFormatters;
  final Color outlineColor;
  final TextInputType? texttype;
  Function(String)? onInput;
  final VoidCallback? onTap;
  final int maxlines;

  @override
  State<CustomTextFormField> createState() => _CustomtextFormFieldState();
}

class _CustomtextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isInputPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: widget.textCapital
          ? TextCapitalization.characters
          : TextCapitalization.none,
      onTap: widget.onTap,
      style: TextStyle(
        fontSize: 16,
      ),
      readOnly: widget.readonly,
      maxLines: widget.maxlines,
      cursorColor: const Color(0xFF1B8DC9),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        errorStyle:
            TextStyle(fontSize: 13, color: Color.fromARGB(255, 245, 130, 122)),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Color(0xFFDBDBDB), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Color(0xFFDBDBDB), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Color(0xFF707070), width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        hintStyle: TextStyle(
            color: Color(0xFF737373),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "DM Sans"),
        hintText: widget.hintText,
        prefixIconColor: Color(0xFF737373),
        prefixIcon: widget.leadingIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
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
                            padding: EdgeInsets.only(right: 20.0),
                            // child: Icon(Icons.abc_rounded),

                            child: SvgPicture.asset(
                              'assets/eye-closed-svgrepo-com.svg',
                              color: Color(0XFF959595),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xFF959595),
                            ),
                          ),
                        ],
                      ),
              )
            : null,
      ),
      keyboardType: widget.texttype,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Empty value";
            }
            return null;
          },
      inputFormatters: widget.inputFormatters,
      onChanged: (value) {
        widget.onInput?.call(value);
      },
    );
  }
}
