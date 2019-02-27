import 'package:scoped_model/scoped_model.dart';

class AppTheme {
  int mainColor = 0xFFD32F2F;
  int secondColor = 0xFFFFFFFF;
  int thirdColor = 0xFFFAFAFA;
  int greyColor = 0x8A000000;
  int blackColor = 0xFF000000;
}

mixin AppThemeModel on Model {
  AppTheme _appTheme = new AppTheme();
  get theme => _appTheme;
}
