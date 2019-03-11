import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/router/index.dart' show FluroRouter;

class _IndexState extends State<Index> {
  static String _version = '';

  @override
  void initState() {
    super.initState();
    _version = widget.model.config.state.version;
  }

  List<dynamic> _getList() {
    return [
      {
        'name': AppLocalizations.$t('common.changeLanguage'),
        'icon': 59540, // language
      },
      {
        'name': AppLocalizations.$t('common.changeVersion') + '  ' + _version,
        'icon': 58919, // sync
      },
      {
        'name': AppLocalizations.$t('common.changeEnvironment'),
        'icon': 57539, // import_export
      },
      {
        'name': AppLocalizations.$t('common.compProgress'),
        'icon': 57709, // low_priority
      }
    ];
  }

  actionsEvent(int index) {
    switch (index) {
      case 0:
        AppLocalizations.changeLanguage();
        break;
      case 1:
        widget.model.dispatch('config', 'setVersion').then((resp) {
          _version = widget.model.config.state.version;
        });
        break;
      case 2:
        widget.model.dispatch('config', 'setEnv');
        break;
      case 3:
        FluroRouter.router.navigateTo(
          context,
          '/webview?url=${Uri.encodeComponent(widget.model.config.state.env.githubWeb)}&title=${AppLocalizations.$t('common.compProgress')}',
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
                      return ListTile(
                        onTap: () {
                          this.actionsEvent(index);
                        },
                        leading: Icon(
                          IconData(
                            this._getList()[index]['icon'],
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: true,
                          ),
                        ),
                        title: Text('${this._getList()[index]['name']}'),
                      );
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
