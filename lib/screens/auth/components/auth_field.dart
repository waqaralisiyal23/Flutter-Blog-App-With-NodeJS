import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const AuthField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.iconData,
    this.textInputAction,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
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
