import 'package:flutter/material.dart';
import 'package:efox_flutter/store/models/main_state_model.dart' show MainStateModel;
import 'package:efox_flutter/store/store.dart' show STORE;

class Index extends StatelessWidget {
  final Widget child;

  Index({Key key, this.child}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return STORE.connect(
      builder: (context, child, MainStateModel model) {
        return Container(
          height: 420.0,
          margin: EdgeInsets.fromLTRB(50, 40, 50, 40),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(model.theme.mainColor),
              width: 1.0
            ),
          ),
          child: this.child,
        );
      },
    );
  }
}