import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var params = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RaisedButton'),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  params == 0.0 ? params = 10.0 : params = 0.0;
                });
              },
              child: Text('BeveledRectangleBorder'),
              textColor: Colors.white,
              textTheme: ButtonTextTheme.normal,
              color: Theme.of(context).primaryColor,
              splashColor: Colors.pink,
              highlightColor: Colors.pink,
              elevation: 2.0,
              highlightElevation: 8.0,
              padding: EdgeInsets.all(10.0),
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.green
                ),
                borderRadius: BorderRadius.all(Radius.circular(params))
              )
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  params == 0.0 ? params = 10.0 : params = 0.0;
                });
              },
              child: Text('RoundedRectangleBorder'),
              textColor: Colors.white,
              textTheme: ButtonTextTheme.normal,
              color: Theme.of(context).primaryColor,
              splashColor: Colors.pink,
              highlightColor: Colors.pink,
              elevation: 2.0,
              highlightElevation: 8.0,
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.green
                ),
                borderRadius: BorderRadius.circular(params)
              )
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  params == 0.0 ? params = 10.0 : params = 0.0;
                });
              },
              child: Text('CircleBorder'),
              textColor: Colors.white,
              textTheme: ButtonTextTheme.normal,
              color: Theme.of(context).primaryColor,
              splashColor: Colors.pink,
              highlightColor: Colors.pink,
              elevation: 2.0,
              highlightElevation: 8.0,
              padding: EdgeInsets.all(30.0),
              shape: CircleBorder(
                side: BorderSide(
                  color: Colors.green
                ),
              )
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  params == 0.0 ? params = 10.0 : params = 0.0;
                });
              },
              child: Text('StadiumBorder'),
              textColor: Colors.white,
              textTheme: ButtonTextTheme.normal,
              color: Theme.of(context).primaryColor,
              splashColor: Colors.pink,
              highlightColor: Colors.pink,
              elevation: 2.0,
              highlightElevation: 8.0,
              padding: EdgeInsets.all(10.0),
              shape: StadiumBorder(
                side: BorderSide(
                  color: Colors.green
                )
              )
            ),
            RaisedButton.icon(
              icon: Icon(Icons.android, size: 28.0,),
              label: Text('RaisedButton.icon'),
              onPressed: () {},
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
