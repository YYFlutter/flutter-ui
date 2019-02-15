class ItemInfo extends Object {
  int code;
  String name;

  ItemInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }
}

class ItemListInfo {
  String typeName;
  int code;
  List widgetList;

  ItemListInfo.fromJson(Map<String, dynamic> json) {
    typeName = json['typeName'];
    code = json['code'];

    List _list = [];
    json['widgetList'].forEach((item) {
      _list.add(new ItemInfo.fromJson(item));
    });
    widgetList = _list;
  }
}

class WidgetListInfo extends Object {
  String name;
  List list;

  WidgetListInfo.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];

    List _list = [];
    json['list'].forEach((item) {
      _list.add(new ItemListInfo.fromJson(item));
    });
    list = _list;
  }
}