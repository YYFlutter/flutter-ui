import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/router/index.dart' show FluroRouter;

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
  }

  List<dynamic> _getList() {
    return [
      {
        'name': AppLocalizations.$t('common.changeLanguage'),
        'icon': 59540, // language
        'index': 0
      },
      {
        'name': widget.model.config.state.isPro ? AppLocalizations.$t('mine.loadLocal') : AppLocalizations.$t('mine.loadNetwork'),
        'icon': 57539, // import_export
        'index': 2,
      },
      {
        'name': AppLocalizations.$t('common.compProgress'),
        'icon': 57709, // low_priority
        'index': 3
      }
    ];
  }

  actionsEvent(int index) {
    switch (index) {
      case 0:
        AppLocalizations.changeLanguage();
        break;
      case 2:
        widget.model.dispatch('config', 'setEnv');
        break;
      case 3:
        FluroRouter.router.navigateTo(
          context,
          '/webview?url=${Uri.encodeComponent(widget.model.config.state.env.githubWeb)}&title=${Uri.encodeComponent(AppLocalizations.$t('common.compProgress'))}',
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return NestedScrollView(
          headerSliverBuilder: (context, flag) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  pinned: true,
                  expandedHeight: 150,
                  centerTitle: true,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    title: Text(
                      'Flutter UI',
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Builder(builder: (context) {
            List list = this._getList();
            return CustomScrollView(
              slivers: <Widget>[
                // SliverOverlapInjector与SliverOverlapAbsorber是相对成立的，
                // 若不增加SliverOverlapInjector，则下方的list顶部会被上方headerSliverBuilder所创建的组件遮住，
                // 增加后，类似clear:both效果，使得布局能顺畅衔接
                SliverOverlapInjector(
                  // This is the flip side of the SliverOverlapAbsorber above.
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      dynamic item = list[index];
                      if (item['show'] ?? true) {
                        return ListTile(
                          onTap: () {
                            this.actionsEvent(item['index']);
                          },
                          leading: Icon(
                            IconData(
                              item['icon'],
                              fontFamily: 'MaterialIcons',
                              matchTextDirection: true,
                            ),
                          ),
                          title: Text('${item['name']}'),
                        );
                      } else {
                        return Container();
                      }
                    },
                    childCount: this._getList().length,
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}

class Index extends StatefulWidget {
  final dynamic model;

  Index({Key key, this.model}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}
