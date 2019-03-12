import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final _textEditingController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.text = '';
    _textEditingController.addListener(() {
      print('input: ${_textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _textEditingController,
              maxLength: 20,
              maxLines: 1,
              obscureText: false,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).primaryColor
              ),
              onChanged: (value) {
                print('正在输入：$value');
              },
              onSubmitted: (value) {
                print('sumbit输入完毕: $value');
              },
              decoration: InputDecoration(
                icon: Icon(Icons.subject),
                labelText: 'Title',
                hintText: 'Enter the post title',
                errorText: 'error',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _textEditingController,
              maxLength: 20,
              maxLines: 1,
              obscureText: false,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).primaryColor
              ),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter the post title',
                helperText: 'phone',
                filled: true,
                fillColor: Colors.blue.shade100,
                prefixIcon: Icon(Icons.local_airport),
                suffixText: 'airport'
              ),
            ),
          ),
           Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _textEditingController,
              maxLength: 20,
              style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).primaryColor
              ),
              keyboardType: TextInputType.number,
              cursorColor: Colors.green,
              // cursorRadius: Radius.circular(20),
              // cursorWidth: 40,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter the post title',
                helperText: 'number',
                filled: true,
                fillColor: Colors.blue.shade100,
                prefixIcon: Icon(Icons.local_airport),
                suffixIcon: Icon(Icons.local_drink),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0)
                )
              ),
            ),
          )
        ],
      )
    );
  }
}
