import 'package:flutter/material.dart';

class ZSHAppTheme {
  // 1.公有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;


  // 2.普通模式
  static const Color norTextColors = Colors.red;
  static const Color darkTextColors = Colors.green;


  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),//widget背景色
    textTheme: TextTheme(
      body1: TextStyle(fontSize: bodyFontSize),
      display1: TextStyle(fontSize: smallFontSize),
      display2: TextStyle(fontSize: normalFontSize),
      display3: TextStyle(fontSize: largeFontSize),
      // display3: TextStyle(fontSize: largeFontSize,color: norTextColors),

    )
  );

// 3.暗黑模式
  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: TextTheme(
          body1: TextStyle(fontSize: normalFontSize,color: darkTextColors)
      )
  );



}