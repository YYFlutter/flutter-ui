import 'package:flutter/material.dart';


class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider'),),
      body: Center(
        child: Slider(
          value: _sliderValue,
          onChanged: (value){
            setState(() {
              _sliderValue = value;
            });
          },
          onChangeStart: (value){
            print('onChangeStart:$value');
          },
          onChangeEnd: (value) {
            print('onChangeEnd:$value');
          },
          min: 0.0,
          max: 100.0,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
          divisions: 10,
          label: '${_sliderValue.toInt()}',
        ),
      ),
    );
  }
}