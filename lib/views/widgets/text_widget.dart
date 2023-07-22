import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {key,
      this.label,
      this.fontSize = 15,
      this.color,
      this.fontWeight})
      : super(key: key);

  final String label;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      // textAlign: TextAlign.justify,
      style: TextStyle(
        fontFamily: 'ro',
        color: color ?? Color.fromRGBO(0, 0, 0, 1),
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}