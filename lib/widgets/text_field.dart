import 'package:circlify/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final String? labelText;
  final TextInputType textInputType;

  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      required this.isPass,
      required this.hintText,
      required this.textInputType,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    final InputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context, color: primaryColor),
        borderRadius: BorderRadius.circular(20));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder,
        focusedBorder: InputBorder,
        enabledBorder: InputBorder,
        filled: true,
        labelText: labelText,
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
