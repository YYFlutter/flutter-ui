import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<String> _tags = [
    'cake',
    'chicken',
    'apple'
  ];
  String _action = '点击下面';
  List<String> _selected = [];
  String _choice = '点击下面';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chip'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Container(
              child: Text('chip:'),
            ),
            ChipDemo(),
            Divider(),
            ChipDemoDelete(),
            Divider(),
            Container(
              child: Text('ActionChip: $_action'),
            ),
            ActionChipDemo(),
            Divider(),
            Container(
              child: Text('FilterChip: $_selected'),
            ),
            FilterChipDemo(),
            Divider(),
            Container(
              child: Text('ChoiceChip: $_choice'),
            ),
            ChoiceChipDemo()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: (){
          setState(() {
            _tags = [
              'cake',
              'chicken',
              'apple'
            ];
            _selected = [];
            _action = '点击下面';
            _choice = '点击下面';
          });
        },
      ),
    );
  }

  Widget ChipDemo() {
    return Wrap(
      spacing: 20.0,
      runSpacing: 8.0,
      children: <Widget>[
        Chip(
          label: Text('Efox'),
        ),
        Chip(
          label: Text('backgroundColor'),
          backgroundColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(color: Colors.white),
          // labelPadding: EdgeInsets.all(2.0),
        ),
        Chip(
          label: Text('Efox Team'),
          avatar: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Text('E'),
          ),
        ),
        Chip(
          label: Text('Efox Team'),
          avatar: CircleAvatar(
            backgroundImage: NetworkImage('http://pic1.win4000.com/wallpaper/2019-04-02/5ca2ccd945964.jpg'),
          ),
        ),
        Chip(
          label: Text('City'),
          onDeleted: (){},
          deleteIcon: Icon(Icons.delete, size: 26.0,),
          deleteIconColor: Theme.of(context).primaryColor,
          deleteButtonTooltipMessage: 'Remove this tag',
        )
      ],
    );
  }

  Widget ChipDemoDelete () {
    return Wrap(
      spacing: 8.0,
      children: _tags.map((tag){
        return Chip(
          label: Text(tag),
          onDeleted: () {
            setState(() {
              _tags.remove(tag);
            });
          },
        );
      }).toList(),
    );
  }

  Widget ActionChipDemo () {
    return Wrap(
      spacing: 8.0,
      children: _tags.map((tag){
        return ActionChip(
          label: Text(tag),
          onPressed: (){
            setState(() {
              _action = tag;
            });
          },
        );
      }).toList(),
    );
  }

  Widget FilterChipDemo(){
    return Wrap(
      spacing: 8.0,
      children: _tags.map((tag){
        return FilterChip(
          label: Text(tag),
          selected: _selected.contains(tag),
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (value) {
            setState(() {
              if (_selected.contains(tag)) {
                _selected.remove(tag);
              } else {
                _selected.add(tag);
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget ChoiceChipDemo () {
    return Wrap(
      spacing: 8.0,
      children: _tags.map((tag) {
        return ChoiceChip(
          label: Text(tag),
          selectedColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(color: Colors.white),
          selected: _choice == tag,
          onSelected: (value) {
            setState(() {
              _choice = tag;
            });
          },
        );
      }).toList(),
    );
  }
}
