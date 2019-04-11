import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List data = [
    {
      'enable': true,
      'subtitle': 'subtitle is not focus',
      'selected': false
    },
    {
      'enable': false,
      'subtitle': 'subtitle is not focus',
      'selected': true
    },
    {
      'enable': true,
      'subtitle': 'subtitle is not focus',
      'selected': true
    }
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTile'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/imgs/cool.jpg'),
                  ),
                  title: Text('title'),
                  subtitle: Text(data[index]['subtitle']),
                  trailing: Icon(Icons.arrow_right),
                  onTap: (){
                    if (!data[index]['selected']) {
                      this.setState((){
                        data[index]['subtitle'] = 'subtitle is focus now';
                        data[index]['selected'] = true;
                      });
                    } else {
                      this.setState((){
                        data[index]['subtitle'] = 'subtitle is not focus';
                        data[index]['selected'] = false;
                      });
                    }
                  },
                  onLongPress: (){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('你长按了我'),
                        backgroundColor: Theme.of(context).primaryColor,
                        action: SnackBarAction(
                          textColor: Colors.white,
                          label: '取消',
                          onPressed: (){},
                        ),
                        duration: Duration(seconds: 2),
                      )
                    );
                  },
                  selected: data[index]['selected'],
                  isThreeLine: false,
                  enabled: data[index]['enable'],
                  contentPadding: EdgeInsets.all(0),
                ),
                Divider()
              ],
            );
          },
        )
      )
    );
  }
}
