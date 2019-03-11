import 'package:flutter/material.dart';
import 'package:efox_flutter/router/index.dart' show FluroRouter;
import 'package:efox_flutter/store/models/main_state_model.dart'
    show MainStateModel;
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/components/header.dart' as Header;
import 'package:efox_flutter/widget/index.dart' as WidgetRoot;
import 'package:efox_flutter/config/theme.dart' show AppTheme;

class Index extends StatefulWidget {
  final MainStateModel model;

  Index({Key key, this.model}) : super(key: key);

  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List _mapList = [];
  int _isExpandedIndex = -1;

  @override
  initState() {
    super.initState();
    this._mapList = WidgetRoot.getAllWidgets();
  }

  List<Widget> appBarActions() {
    return [
      PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
        ),
        onSelected: (local) {
          AppLocalizations.changeLanguage(Locale(local));
          print('local=$local');
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Text('中文'),
                  ],
                ),
                value: 'zh',
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Text('english'),
                  ],
                ),
                value: 'en',
              ),
            ],
      ),
    ];
  }

  renderPanel(widgetsItem, index) {
    String nameSpaces = widgetsItem.nameSpaces;
    List _tmpWidgetList = widgetsItem.widgetList;
    return ExpansionPanel(
      headerBuilder: (context, flag) {
        return Container(
          // padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(
              IconData(
                widgetsItem.code,
                fontFamily: 'MaterialIcons',
                matchTextDirection: true,
              ),
            ),
            title: Text('${widgetsItem.typeName}'),
          ),
        );
      },
      body: Container(
        child: GridView.count(
          childAspectRatio: 1.3,
          padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisCount: 3,
          children: List.generate(
            _tmpWidgetList.length,
            (index) {
              return FlatButton(
                color: Color(AppTheme.secondColor),
                splashColor: Color(AppTheme.mainColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      IconData(
                        _tmpWidgetList[index].code,
                        fontFamily: 'MaterialIcons',
                        matchTextDirection: true,
                      ),
                      color: Color(AppTheme.mainColor),
                      size: 32,
                    ),
                    Text(
                      '${_tmpWidgetList[index].title}',
                      //overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                onPressed: () {
                  FluroRouter.router.navigateTo(
                    context,
                    nameSpaces + _tmpWidgetList[index].title,
                  );
                },
              );
            },
          ),
        ),
      ),
      isExpanded: _isExpandedIndex == index,
    );
  }

  Widget build(BuildContext context) {
    // 实例化语言包
    return Scaffold(
      appBar: AppBar(
        title: Header.Index(
          AppLocalizations.$t('nav_title_0'),
        ),
        actions: appBarActions(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        // padding: EdgeInsets.all(10),
        child: ExpansionPanelList(
          animationDuration: Duration(milliseconds: 500),
          children: List.generate(
            _mapList.length,
            (_index) {
              return renderPanel(_mapList[_index], _index);
            },
          ),
          expansionCallback: (index, flag) {
            if (flag) {
              index = -1;
            }
            setState(() {
              this._isExpandedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
