import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.extent'),
      ),
      body: GridView.extent(
        scrollDirection: Axis.vertical,
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        padding: EdgeInsets.all(10),
        children: List.generate(
          10,
          (index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.1,
                )
              ),
              child: Image.network('https://static.moschat.com/efoxfile/Moschat/ojbk.png'),
            );
          },
        ),
      ),
    );
  }
}
