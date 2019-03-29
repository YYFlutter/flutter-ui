import 'package:flutter/material.dart';
import 'package:efox_flutter/store/index.dart' show Store;

OverlayEntry overlayEntry = null;
var count = 0;
/**
 * loading: 可配置参数
 * requestOrComplete: 是否发送请求或已完成 true表示发送请求需要开启loading，false表示完成请求可关闭loading
 */
void showAppLoading(loading, requestOrComplete) {
  // showDialog(
  //     context: Store.widgetCtx,
  //     builder: (context) {
  //       return Center(
  //         child: CircularProgressIndicator(
  //           // value: 0.5,
  //           semanticsLabel: 'hsh',
  //           semanticsValue: 'sds',
  //         ),
  //       );
  //     });
  if (requestOrComplete) {
    ++count;
  } else {
    --count;
  }
  if (count >= 1 && overlayEntry?.maintainState == true) return;
  if (overlayEntry?.maintainState == true &&
      requestOrComplete == false &&
      count == 0) {
    print('移除啦~~~');
    overlayEntry.maintainState = false;
    overlayEntry.remove();
    return;
  }
  // var overlayState = Overlay.of(Store.widgetCtx);

  Navigator.of(Store.widgetCtx).push(MaterialPageRoute(builder: (context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // body: OverlayEntry(),
    );
  }));
  overlayEntry.maintainState = true;

  // Navigator.of(Store.widgetCtx).push(MaterialPageRoute(builder: (context) {
  //   return Index();
  // }));
}

// class Index extends Dialog {
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: Column(
//           children: <Widget>[CircularProgressIndicator(), Text('loading...')],
//         ),
//       ),
//     );
//   }
// }
