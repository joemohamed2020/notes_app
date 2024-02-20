import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.maxLines = 1, required this.text});
  final int? maxLines;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: primaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(primaryColor),
          hintText: text,
          hintStyle: const TextStyle(color: primaryColor)),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
