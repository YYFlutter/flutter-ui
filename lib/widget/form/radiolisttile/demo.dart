import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _radioValue = 0;

  @override
  void initState() {
    super.initState();
  }

  void _handleRadioValueChanged (int value) {
    setState(() {
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio'),
      ),
      body: Column(
        children: <Widget>[
          Radio(
            value: 0,
            groupValue: _radioValue,
            onChanged: _handleRadioValueChanged,
            activeColor: Theme.of(context).primaryColor,
          ),
          Radio(
            value: 1,
            groupValue: _radioValue,
            onChanged: _handleRadioValueChanged,
            activeColor: Theme.of(context).primaryColor,
          ),
          Radio(
            value: 2,
            groupValue: _radioValue,
            onChanged: _handleRadioValueChanged,
            activeColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
