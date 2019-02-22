import 'package:flutter/material.dart';
import 'package:efox_flutter/store/models/main_state_model.dart';


class Index extends StatelessWidget {
  final MainStateModel model;
  Index({Key key, this.model}):super(key: key);

  @override
  Widget build (BuildContext context) {
    return Container(
      child: Center(
        child: Text('a'),
      ),
    );
  }
}