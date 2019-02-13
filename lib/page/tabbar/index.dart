import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/app_translations.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ComponentsPage extends StatefulWidget {
  _ComponentsPageState createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> {
  List mapList = [];

  @override
  initState() {
    super.initState();
    getWidgetList().then((res) {
      setState(() {
        mapList = res['list'];
      });
    });
  }

  getWidgetList() async {
    String widgetString = await rootBundle
        .loadString('assets/json/widget_list.json', cache: false);
    return json.decode(widgetString);
  }

  Widget build(BuildContext context) {
    AppTranslations lang = AppTranslations.of(context);
    const box_height = 100.0;
    return Scrollbar(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: mapList.map(
              (item) {
                
                print('item ${item}  ${(item['widgetList'].length / 3).ceil()}');
                return ExpansionTile(
                  title: Text(item['typeName']),
                  leading: Icon(Icons.account_balance_wallet),
                  backgroundColor: Colors.white12,
                  children: [
                    Container(
                      height: ((item['widgetList'].length / 3).ceil()) * 140.0,
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(item['widgetList'].length, (index) {
                          return Container(
                            height: box_height,
                            child: Text('index ${item['widgetList'][index]['name']}'),
                          );
                        }),
                      ),
                    )
                  ],
                  initiallyExpanded: false,
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
