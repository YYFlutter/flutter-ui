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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: _textEditingController,
            maxLength: 20,
            maxLines: 1,
            obscureText: false,
            textAlign: TextAlign.center,
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
              // labelText: 'Title',
              // hintText: 'Enter the post title',
              // filled: true
            ),
          ),
        )
      ),
    );
  }
}
