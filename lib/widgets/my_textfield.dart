import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.validator,
    required this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        height: 1,
      ),
      decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.blue, width: 22),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
      validator: validator,
    );
  }
}
