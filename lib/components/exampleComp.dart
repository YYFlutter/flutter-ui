import 'package:flutter/material.dart';
import 'package:efox_flutter/store/models/main_state_model.dart'
    show MainStateModel;
import 'package:efox_flutter/store/index.dart' show Store;
import 'package:efox_flutter/config/theme.dart' show AppTheme;

class Index extends StatelessWidget {
  final Widget child;

  Index({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _dp = 1.4;
    return Store.connect(
      builder: (context, child, MainStateModel model) {
        return Center(
          child: Container(
            width: size.width / _dp,
            height: size.height / _dp,
            margin: EdgeInsets.all(30 / _dp),
            decoration: BoxDecoration(
              border: Border.all(color: Color(AppTheme.mainColor), width: 1.0),
            ),
            child: this.child,
          ),
        );
      },
    );
  }
}
