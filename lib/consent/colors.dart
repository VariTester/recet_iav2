import 'package:flutter/material.dart';

// Color background = Color(0xffff6f4fa);
// Color maincolor = Color(0xfff96163);
// Color font = Color(0xfff3C444C);

Color background = Color(0xfff6f4fa);
Color maincolor = Color(0xFF2ECC71);
Color font = Color(0xfff3C444C);

Color acento = Color(0xFF3498DB);

hexStringColor(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if(hexColor.length == 6){
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}