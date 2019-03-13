import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate() async{
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date == null) {
      return;
    }
    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _selectTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if(time ==null) {
      return;
    }
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DayPicker'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('日期选择'),
            RaisedButton(
              onPressed: _selectDate,
              child: Text('${DateFormat.yMd().format(selectedDate)}'),
            ),
            Text('时间选择'),
            RaisedButton(
              onPressed: _selectTime,
              child: Text('${selectedTime.format(context)}'),
            )
          ],
        ),
      ),
    );
  }
}
