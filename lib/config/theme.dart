import 'package:flutter/material.dart';

class AppTheme {
  static int mainColor = 0xFFD32F2F;
  static int secondColor = 0xFFFFFFFF;
  static int thirdColor = 0xFFFAFAFA;
  static int greyColor = 0x8A000000;
  static int blackColor = 0xFF000000;
  static ThemeData themData = ThemeData(
    textTheme: TextTheme(
      body1: TextStyle(
          // color: Colors.black,
          // fontWeight: FontWeight.bold,
          ),
    ),
    platform: TargetPlatform.iOS,
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
    scaffoldBackgroundColor: Color(thirdColor), // 整体的scaffold背景颜色
  );
}
