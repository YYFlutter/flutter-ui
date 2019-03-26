import 'package:flutter/material.dart';
import 'package:efox_flutter/config/theme.dart' show AppTheme;
import 'package:efox_flutter/widget/index.dart' as WidgetRoot;
import 'package:efox_flutter/router/index.dart' show FluroRouter;
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);
  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List _mapList = WidgetRoot.getAllWidgets();
  int _currentIndex = -1;
  TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _mapList.length);
    _tabController.addListener(() {
      if (_currentIndex != _tabController.index) {
        _currentIndex = _tabController.index;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Color(AppTheme.mainColor),
            child: SafeArea(
              child: this._TabBar(),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            //this._TabBar(),
            this._TabView()
          ],
        ));
  }

  Widget _TabBar() {
    return TabBar(
        indicatorColor: Color(AppTheme.secondColor),
        controller: _tabController,
        isScrollable: true,
        tabs: _mapList.map((v) {
          return new Tab(
            text: AppLocalizations.$t(v.typeName),
          );
        }).toList());
  }

  Widget _TabView() {
    return Expanded(
      child: new TabBarView(
          controller: _tabController,
          children: List.generate(_mapList.length, (index) {
            return this.Grids(_mapList[index], index);
          })),
    );
  }

  Widget Grids(widgetsItem, index) {
    String nameSpaces = widgetsItem.nameSpaces;
    List _tmpWidgetList = widgetsItem.widgetList;

    return Container(
      child: GridView.count(
        childAspectRatio: 1.3,
        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        crossAxisCount: 3,
        children: List.generate(
          _tmpWidgetList.length,
          (index) {
            return Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Color(AppTheme.lineColor), width: 0.5)),
              child: FlatButton(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
