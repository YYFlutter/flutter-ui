import 'package:flutter/material.dart';
import 'package:efox_flutter/store/models/main_state_model.dart'
    show MainStateModel;
import 'package:efox_flutter/store/store.dart' show Store;
import 'package:efox_flutter/config/theme.dart' show AppTheme;

class Index extends StatelessWidget {
  final Widget child;

  Index({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Store.connect(
      builder: (context, child, MainStateModel model) {
        return Container(
          height: 420.0,
          margin: EdgeInsets.fromLTRB(50, 40, 50, 40),
          decoration: BoxDecoration(
            border: Border.all(color: Color(AppTheme.mainColor), width: 1.0),
          ),
          child: this.child,
        );
      },
    );
  }
}
