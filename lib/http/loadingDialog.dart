import 'package:flutter/material.dart';
import 'package:efox_flutter/store/index.dart' show Store;

OverlayEntry overlayEntry = null;
void showAppLoading() {
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
  if (overlayEntry?.maintainState == true) {
    print('移除啦~~~');
    overlayEntry.maintainState = false;
    overlayEntry.remove();
    return;
  }
  var overlayState = Overlay.of(Store.widgetCtx);
  overlayEntry = new OverlayEntry(builder: (context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CircularProgressIndicator(), Text('loading...')],
        ),
        onTap: () {
          print('移除啦~~~ ${overlayEntry.maintainState}');
          overlayEntry.maintainState = false;
          overlayEntry?.remove();
          print('overlayEntry ${overlayEntry}');
        },
      ),
    );
  });
  // 加载框
  overlayState.insert(overlayEntry);
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
