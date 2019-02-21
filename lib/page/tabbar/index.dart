import 'package:flutter/material.dart';
// import 'package:efox_flutter/lang/app_translations.dart';
import 'package:efox_flutter/router/index.dart';
import 'package:efox_flutter/store/models/main_state_model.dart';
import 'package:efox_flutter/store/STORE.dart' show STORE;
import 'package:efox_flutter/widget/index.dart' as WidgetRoot;

class ComponentsPage extends StatefulWidget {
  _ComponentsPageState createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage>
    with SingleTickerProviderStateMixin {
  List mapList = [];

  @override
  initState() {
    super.initState();
    this.mapList = WidgetRoot.getAllWidgets();
  }

  /**
   * 渲染折叠板
   */
  Widget renderExpanel(MainStateModel model, item) {
    List _tmpWidgetList = item.widgetList;
    return ExpansionTile(
      title: Text(
        item.typeName,
      ),
      leading: Icon(
        IconData(item.code ?? 58353,
            fontFamily: 'MaterialIcons', matchTextDirection: true),
        color: Color(model.theme.secondColor),
      ),
      backgroundColor: Colors.white70,
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
                  border: Border(
                      bottom: BorderSide(
                    width: .1,
                    color: Color(model.theme.mainColor),
                  )),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 48,
                      icon: Icon(
                        IconData(_tmpWidgetList[index].code ?? 59101,
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: true),
                        color: Color(model.theme.mainColor),
                      ),
                      onPressed: () {
                        FluroRouter.router.navigateTo(
                            context, _tmpWidgetList[index].routerName);
                      },
                    ),
                    Text(_tmpWidgetList[index].name),
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
    return STORE.connect(
      builder: (context, child, model) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          child: Column(
            children: mapList.map(
              (item) {
                return renderExpanel(model, item);
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
