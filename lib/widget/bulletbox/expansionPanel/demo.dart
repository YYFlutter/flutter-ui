import 'package:flutter/material.dart';

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;
  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded
  });
}

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<ExpansionPanelItem> _expansionPanelItems;
  @override
    void initState() {
      super.initState();
      _expansionPanelItems = <ExpansionPanelItem>[
        ExpansionPanelItem(
          headerText: 'Panel A',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Image.network('http://pic1.win4000.com/wallpaper/2019-02-15/5c664c46823f8.jpg'),
          ),
          isExpanded: false
        ),
        ExpansionPanelItem(
          headerText: 'Panel B',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Image.network('http://pic1.win4000.com/wallpaper/2019-02-14/5c651084373de.jpg'),
          ),
          isExpanded: false
        ),
        ExpansionPanelItem(
          headerText: 'Panel C',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Image.network('http://pic1.win4000.com/wallpaper/2019-02-14/5c65107a0ee05.jpg'),
          ),
          isExpanded: false
        )
      ];

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExpansionPanel'),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: ExpansionPanelList(
          animationDuration: Duration(microseconds: 500),
          expansionCallback: (int panelIndex, bool isExpaned) {
            setState(() {
              _expansionPanelItems[panelIndex].isExpanded = !isExpaned;
            });
          },
          children: _expansionPanelItems.map(
            (ExpansionPanelItem item) {
              return ExpansionPanel(
                isExpanded: item.isExpanded,
                body: item.body,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      item.headerText,
                      style: Theme.of(context).textTheme.title,
                    ),
                  );
                }
              );
            }
          ).toList(),
        ),
      ),
    );
  }
}