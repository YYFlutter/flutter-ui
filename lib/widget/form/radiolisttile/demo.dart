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
        title: Text('RadioListTile'),
      ),
      body: Column(
        children: <Widget>[
          RadioListTile(
            value: 0,
            groupValue: _radioValue,
            onChanged: _handleRadioValueChanged,
            activeColor: Theme.of(context).primaryColor,
            title: Text('RadioListTile A'),
            subtitle: Text('Description'),
            secondary: Icon(Icons.filter_1),
            selected: _radioValue == 0,
          ),
          RadioListTile(
            value: 1,
            groupValue: _radioValue,
            onChanged: _handleRadioValueChanged,
            activeColor: Theme.of(context).primaryColor,
            title: Text('RadioListTile B'),
            subtitle: Text('Description'),
            secondary: Icon(Icons.filter_2),
            selected: _radioValue == 1,
          ),
          RadioListTile(
            value: 2,
            groupValue: _radioValue,
            onChanged: _handleRadioValueChanged,
            activeColor: Theme.of(context).primaryColor,
            title: Text('RadioListTile C'),
            subtitle: Text('Description'),
            secondary: Icon(Icons.filter_3),
            selected: _radioValue == 2,
          ),
        ],
      ),
    );
  }
}
