import 'package:flutter/material.dart';

/**
 * yello #FFEB3B
 * red #F44336
 * blue #2196F3
 */

class AppTheme {
  static int yellow = 0xFFFFEB3B;
  static int orange = 0xFFFF9800;
  static int amber = 0xFFFFC107;
  static int lime = 0xFFCDDC39;
  static int lightGreen = 0xFF8BC34A;
  static int red = 0xFFF44336;
  static int deepOrange = 0xFFFF5722;
  static int blue = 0xFF2196F3;
  static int pink = 0xFFE91E63;
  //static int mainColor = 0xFFD32F2F;
  static int mainColor = red;
  static int secondColor = 0xFFFFFFFF;
  static int thirdColor = 0xFFFAFAFA;
  static int greyColor = 0x8A000000;
  static int blackColor = 0xFF000000;
  static int lineColor = 0xFFEEEEEE;
  static ThemeData themData = ThemeData(
    textTheme: TextTheme(
      body1: TextStyle(
          // color: Colors.black,
          // fontWeight: FontWeight.bold,
          ),
    ),
    //platform: TargetPlatform.iOS,
    iconTheme: IconThemeData(
      size: 32,
      color: Color(thirdColor),
      opacity: 0.85,
    ),
    // primaryIconTheme 导航栏按钮颜色
    primaryIconTheme: IconThemeData(
      color: Color(secondColor),
    ),
    accentColor: Colors.grey, // 选中颜色
    primaryColor: Color(mainColor), // appbar背景
    scaffoldBackgroundColor: Color(secondColor), // 整体的scaffold背景颜色
  );
}
