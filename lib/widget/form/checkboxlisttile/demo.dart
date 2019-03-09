import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<bool> checkboxValue = [false, true, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CheckboxListTile'),),
      body: ListView(
        children: List.generate(4, (index) {
          return CheckboxListTile(
            value: checkboxValue[index],
            onChanged: (value) {
              setState(() {
                checkboxValue[index] = value;
              });
            },
            activeColor: Theme.of(context).primaryColor,
            title: Text('Checkbox Item ${index+1}'),
            subtitle: Text('Description'),
            isThreeLine: false,
            dense: false,
            secondary: Icon(Icons.bookmark),
            // selected: checkboxValue[index],
            controlAffinity: ListTileControlAffinity.platform,
          );
        }),
      ),
    );
  }
}