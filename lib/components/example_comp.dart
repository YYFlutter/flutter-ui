import 'package:flutter/material.dart';
import 'package:efox_flutter/config/theme.dart' show AppTheme;

class Index extends StatelessWidget {
  final Widget child;

  Index({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Color(AppTheme.mainColor), width: 1.0),
        ),
        child: SizedBox.fromSize(
          size: size / 1.3,
          child: this.child,
        ),
      ),
    );
  }
}
