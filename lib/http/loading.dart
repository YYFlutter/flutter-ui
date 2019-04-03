import 'package:flutter/material.dart';
import 'package:efox_flutter/store/index.dart' show Store;

bool loading = false;
Set dict = Set();

void beforeRequest(uri, Map<dynamic, dynamic> options) {
  dict.add(uri);
  if (loading == false) {
    showAppLoading(options);
    loading = true;
  }
}

void afterResponse(uri, Map<dynamic, dynamic> options) {
  dict.remove(uri);
  if (dict.length == 0 && loading == true) {
    Navigator.of(Store.widgetCtx, rootNavigator: true).pop('close dialog');
    loading = false;
  }
}

/**
 * loading: 可配置参数
 * requestOrComplete: 是否发送请求或已完成 true表示发送请求需要开启loading，false表示完成请求可关闭loading
 */
void showAppLoading(Map<dynamic, dynamic> options) {
  options = {
    'notLoading': options['notLoading'] ?? false,
    'text': options['text'] ?? 'loading...'
  };
  showDialog(
    context: Store.widgetCtx,
    builder: (context) {
      return LoadingDialog(text: options['text']);
    },
  );
}

class LoadingDialog extends StatefulWidget {
  final String text;
  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  LoadingDialogState createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
              height: 50,
              width: 50,
            ),
            Divider(
              height: 10,
            ),
            widget.text != null
                ? Text(
                    widget.text,
                    style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color),
                  )
                : ''
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    loading = false;
    dict.clear();
  }
}
