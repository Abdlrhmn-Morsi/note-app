import 'package:flutter/material.dart';
import 'package:molahzati/utilis/my_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  dynamic textController;
  dynamic hint;
  dynamic hintStyle;
  bool isTitle;
  CustomTextField({
    Key? key,
    required this.textController,
    required this.hint,
    required this.hintStyle,
    this.isTitle = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      maxLines:  null,
      cursorColor: Colors.white,
      style: isTitle
          ? TextStyle(color: Colors.grey.shade200, fontSize: 27)
          : TextStyle(color: Colors.grey.shade200, fontSize: 24),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hint,
        hintStyle: hintStyle,
        border: InputBorder.none,
      ),
    );
  }
}
