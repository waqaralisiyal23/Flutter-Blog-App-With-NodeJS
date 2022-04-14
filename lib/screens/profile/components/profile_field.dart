import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  const ProfileField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.iconData,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLength: maxLength,
      maxLines: maxLines,
      cursorColor: const Color(0xff00A86B),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff00A86B),
        )),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff00A86B),
          width: 2,
        )),
        prefixIcon: Icon(
          iconData,
          color: Colors.green,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        hintText: hintText,
      ),
    );
  }
}
