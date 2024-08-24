import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      this.enabled = true,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.isSearch = false,
      this.hintText = '',
      this.inputFormatter,
      this.padding = 8,
      this.controller});
  final String title;
  final TextEditingController? controller;

  final String hintText;
  final bool enabled;
  final bool isSearch;
  final bool isPassword;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType keyboardType;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: hintText,
        labelText: title,
        // alignLabelWithHint: true,
        suffixIcon: Icon(
          Icons.search,
          color: isSearch ? Colors.black : Colors.transparent,
        ),
        contentPadding: EdgeInsets.all(padding),
      ),
      obscureText: isPassword,
    );
  }
}
