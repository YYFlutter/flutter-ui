import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  String value = '加载中';
  @override
  void initState() {
    super.initState();
    loadLocaleText();
  }

  loadLocaleText() async {
    
    String text = await rootBundle.loadString('locale/zh.json');
    print('text $text');
    setState(() {
      value = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('bulid');
    return Scaffold(
      appBar: AppBar(
        title: Text('AssetBundle'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text(value),
        ),
      ),
    );
  }
}
