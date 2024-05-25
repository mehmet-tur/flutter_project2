import 'package:flutter/material.dart';

import 'package:flutter_project2/widgets/app_style.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType textInputType;
  final Icon icon;
  final bool isSecure;
  const TextFieldInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.textInputType,
    required this.icon,
    this.isSecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: isSecure,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: appStyle(Colors.black, FontWeight.bold, 16),
          prefixIcon: icon,
          prefixIconColor: Colors.black,
        ));
  }
}
