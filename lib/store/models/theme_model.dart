import 'package:scoped_model/scoped_model.dart';

class AppTheme {
  int mainColor = 0xFF1A237E;
  int secondColor = 0xFF283593;
}

mixin AppThemeModel on Model {
  AppTheme _appTheme = new AppTheme();
  get theme => _appTheme;
}
