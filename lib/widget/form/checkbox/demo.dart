import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool _checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Checkbox(
            value: _checkBoxValue,
            onChanged: (value) {
              setState(() {
                _checkBoxValue = value;
              });
            },
          ),
        )
      ],
    );
  }
}


// class CheckBoxDemo extends StatefulWidget {
//   @override
//   _CheckBoxDemoState createState() => _CheckBoxDemoState();
// }

// class _CheckBoxDemoState extends State<CheckBoxDemo> {
//   bool _checkBoxValue;
//   // _CheckBoxDemoState({Key key, this._checkBoxValue}):super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: _checkBoxValue,
//       onChanged: (value) {
//         setState(() {
//           _checkBoxValue = value;
//         });
//       },
//     );
//   }
// }