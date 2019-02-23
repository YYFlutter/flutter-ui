import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.builder'),
      ),
      body: GridView.builder(
        itemCount: 31,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 单行最大数量值
        ),
        itemBuilder: (context, index) {
          print('index $index');
          return Center(
            child: Text('index $index'),
          );
        },
      ),
    );
  }
}
