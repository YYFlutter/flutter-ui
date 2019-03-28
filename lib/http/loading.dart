import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NetLoadingDialog extends StatefulWidget {
  String loadingText;
  bool outsideDismiss;

  Function dismissDialog;

  NetLoadingDialog(
      {Key key,
      this.loadingText = "loading...",
      this.outsideDismiss = true,
      this.dismissDialog})
      : super(key: key);

  @override
  State<NetLoadingDialog> createState() => _LoadingDialog();
}

class _LoadingDialog extends State<NetLoadingDialog> {
  _dismissDialog() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    if (widget.dismissDialog != null) {
      widget.dismissDialog(

          //将关闭 dialog的方法传递到调用的页面.
          (){Navigator.of(context).pop();}

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text('haha');
    }
}