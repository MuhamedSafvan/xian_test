import 'package:flutter/material.dart';


class Constants {
  static final rupeeSymbol = "\u20B9";
  static List<Color> themeGradients = [
    Colors.green,
    Color(0xffffffff),
    Color(0xff535353),
    // Colors.black,
    Color(0xfffeefa6)
  ];

  static TextStyle boldHeading =
  TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle boldWord =
  TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle lightWord = TextStyle(fontSize: 15,color: Colors.grey);
  static SizedBox thickSpace = SizedBox(
    height: 10,
  );

}
