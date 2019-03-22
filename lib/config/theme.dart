import 'package:flutter/material.dart';
import 'color.dart' show materialColor;
/**
 * yello #FFEB3B
 * red #F44336
 * blue #2196F3
 */

class AppTheme {
  //static int mainColor = 0xFFD32F2F;
  static int mainColor = materialColor['red'];
  static int secondColor = 0xFFFFFFFF;
  static int thirdColor = 0xFFFAFAFA;
  static int greyColor = 0x8A000000;
  static int blackColor = 0xFF000000;
  static int lineColor = 0xFFEEEEEE;
  static getThemeData(String theme) {
    //print('==================================getThemeData=$theme');
    mainColor = materialColor[theme];
    ThemeData themData = ThemeData(
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
      primaryTextTheme: TextTheme(
          title: TextStyle(
              // color: Colors.red
              ),
          button: TextStyle(color: Colors.red)),
      scaffoldBackgroundColor: Color(secondColor), // 整体的scaffold背景颜色
    );
    return themData;
  }
}
