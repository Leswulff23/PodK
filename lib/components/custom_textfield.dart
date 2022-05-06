import 'package:flutter/material.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;


class CustomField extends StatelessWidget {
  final String labelName;
  final TextInputType inputType;
  final bool obscureText;
  const CustomField({ 
    required this.labelName,
    required this.inputType,
    required this.obscureText,
    Key? key 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscureText,
      style: TextStyle(color: color.AppColor.longColor),
      decoration: InputDecoration(
        labelText: labelName,
        labelStyle: TextStyle(color: color.AppColor.longColor),
        hintStyle: TextStyle(color: color.AppColor.longColor),
        errorStyle: const TextStyle(color: Colors.red),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
      ),
    );
  }
}