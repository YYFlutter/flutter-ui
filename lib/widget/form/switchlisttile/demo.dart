import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool _switchValue = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchListTile'),
      ),
      body: Center(
        child: SwitchListTile(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
          activeColor: Theme.of(context).primaryColor,
          activeTrackColor: Theme.of(context).primaryColor.withOpacity(0.3),
          inactiveThumbColor: Colors.black87,
          inactiveTrackColor: Colors.black12,
          activeThumbImage: NetworkImage('http://pic1.win4000.com/wallpaper/2019-02-15/5c664c4b4dc2f.jpg'),
          inactiveThumbImage: NetworkImage('http://pic1.win4000.com/wallpaper/2019-02-14/5c651084373de.jpg',),
          title: Text('Switch Item A'),
          subtitle: Text('SubTitle'),
          isThreeLine: false,
          secondary: _switchValue ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          selected: _switchValue,
        )
      ),
    );
  }
}
