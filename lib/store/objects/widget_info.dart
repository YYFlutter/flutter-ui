import 'package:flutter/widgets.dart';
class ItemInfo extends Object {
  int code;
  String title;
  Widget widget;
  String webviewTitle;

  ItemInfo({this.code, this.title, this.widget, this.webviewTitle});

  ItemInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    widget = json['widget'];
    webviewTitle = json['webviewTitle'];
  }
}

class ItemListInfo {
  String typeName;
  String nameSpaces;
  int code;
  List widgetList;

  ItemListInfo({ this.typeName, this.nameSpaces, this.code, this.widgetList});

  ItemListInfo.fromJson(Map<String, dynamic> json) {
    typeName = json['typeName'];
    nameSpaces = json['nameSpaces'];
    code = json['code'];

    List _list = [];
    json['widgetList'].forEach((item) {
      _list.add(new ItemInfo.fromJson(item));
    });
    widgetList = _list;
  }
}
