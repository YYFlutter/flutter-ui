import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/app_translations.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ComponentsPage extends StatefulWidget {
  _ComponentsPageState createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage>
    with SingleTickerProviderStateMixin {
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

  Widget renderExpanel(item) {
    List _tmpWidgetList = item['widgetList'];
    return ExpansionTile(
      title: Text(
        item['typeName'],
      ),
      leading: Icon(
        IconData(item['code'] ?? 58353,
            fontFamily: 'MaterialIcons', matchTextDirection: true),
        color: Colors.deepOrange,
      ),
      backgroundColor: Colors.white12,
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 1,
          crossAxisCount: 3,
          children: List.generate(
            _tmpWidgetList.length,
            (index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 48,
                      icon: Icon(
                        IconData(_tmpWidgetList[index]['code'] ?? 59101,
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: true),
                        color: Colors.deepOrange,
                      ),
                      onPressed: () {},
                    ),
                    Text(_tmpWidgetList[index]['name']),
                  ],
                ),
              );
            },
          ),
        ),
      ],
      initiallyExpanded: false,
    );
  }

  Widget build(BuildContext context) {
    AppTranslations lang = AppTranslations.of(context);
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: mapList.map(
              (item) {
                return renderExpanel(item);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
