import 'package:scoped_model/scoped_model.dart';

class AppTheme {
  int mainColor = 0xFF1A237E;
  int secondColor = 0xFF1565C0;
  int thirdColor = 0x8A000000;
  int textColor = 0x8A000000;
}

mixin AppThemeModel on Model {
  AppTheme _appTheme = new AppTheme();
  get theme => _appTheme;
}
