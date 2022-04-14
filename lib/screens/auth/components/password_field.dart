import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onEyePressed;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const PasswordField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.onEyePressed,
    this.textInputAction,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: const Color(0xff00A86B),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff00A86B),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff00A86B),
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.green,
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: 'Enter your password',
      ),
    );
  }
}
