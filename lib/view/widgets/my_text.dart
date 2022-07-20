import 'package:flutter/material.dart';
// ignore: must_be_immutable
class MyText extends StatelessWidget {
  dynamic text;
  double fontSize;
  int maxLines;
  Color color;
  MyText({
    Key? key,
   required this.color,
    required this.text,
    required this.fontSize,
    required this.maxLines,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color:color,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
