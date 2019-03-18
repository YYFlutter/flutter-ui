/**
 * auth: linhaoran
 * Email: 1476589247@qq.com
 */
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table'),),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('http://pic1.win4000.com/wallpaper/2019-01-31/5c52bf7fdc959_270_185.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Table(
            columnWidths: const <int, TableColumnWidth> {
              0: FixedColumnWidth(40.0),
              1: FixedColumnWidth(80.0),
              2: FixedColumnWidth(40.0),
              // 3: FixedColumnWidth(80.0)
            },
            defaultColumnWidth: FixedColumnWidth(100.0),
            textDirection: TextDirection.ltr,
            border: TableBorder.all(
              width: 1.0, style: BorderStyle.solid, color: Theme.of(context).primaryColor
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            // textBaseline: TextBaseline.alphabetic,
            children: List.generate(4, (index) {
              return TableRow(
                children: <Widget>[
                  Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text('A${index+1}', style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),),
                  ),
                  Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text('B${index+1}', style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),),
                  ),
                  Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text('C${index+1}', style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),),
                  ),
                  Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text('D${index+1}', style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),),
                  ),
                ]
              );
            })
          ),
        ),
      )
    );
  }
}