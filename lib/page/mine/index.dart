import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  final dynamic model;
  Index({Key key, this.model}):super(key: key);

  @override
  Widget build (BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('当前为${model.config.state.isPro ? '线上' : '线下'}环境，点击进行切换'),
          onPressed: () {
            model.dispatch('config', 'setEnv');
          },
        ),
      ),
    );
  }
}