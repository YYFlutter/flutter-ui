import 'package:flutter/material.dart';
import 'package:efox_flutter/router/index.dart';
import 'package:efox_flutter/store/models/main_state_model.dart';
import 'package:efox_flutter/widget/index.dart' as WidgetRoot;
import 'package:efox_flutter/config/theme.dart' show AppTheme;

class Index extends StatefulWidget {
  final MainStateModel model;

  Index({Key key, this.model}) : super(key: key);

  _IndexState createState() => _IndexState(model: this.model);
}

class _IndexState extends State<Index>{
  final MainStateModel model;
  List mapList = [];
  int index;

  _IndexState({Key key, this.model});

  @override
  initState() {
    super.initState();
    this.mapList = WidgetRoot.getAllWidgets();
  }

  /**
   * 渲染折叠板
   */
  Widget renderExpanel(MainStateModel model, widgetsItem) {
    String nameSpaces = widgetsItem.nameSpaces;
    List _tmpWidgetList = widgetsItem.widgetList;
    return ExpansionTile(
      onExpansionChanged: (isOpen) {
        print(isOpen);
      },
      title: Text(
        widgetsItem.typeName,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        IconData(
          widgetsItem.code,
          fontFamily: 'MaterialIcons',
          matchTextDirection: true,
        ),
        // color: Color(AppTheme.mainColor),
      ),
      backgroundColor: Colors.grey.shade100.withOpacity(0.1),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 1,
            crossAxisCount: 3,
            children: List.generate(
              _tmpWidgetList.length,
                  (index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: .1,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 48,
                        icon: Icon(
                          IconData(
                            _tmpWidgetList[index].code ?? 59101,
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: true,
                          ),
                          color: Color(AppTheme.mainColor),
                        ),
                        onPressed: () {
                          FluroRouter.router.navigateTo(
                            context,
                            nameSpaces + _tmpWidgetList[index].title,
                          );
                        },
                      ),
                      Text(
                        _tmpWidgetList[index].title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10),
      child: Column(
        children: List.generate(mapList.length, (_index) {
          return renderExpanel(model, mapList[_index]);
        }),
      ),
    );
  }
}
