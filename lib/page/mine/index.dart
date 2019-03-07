import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  final dynamic model;
  Index({Key key, this.model}) : super(key: key);

  final List<dynamic> _list = [
    {
      'name': '切换语言',
      'icon': 59540, // language
    },
    {
      'name': '更新版本',
      'icon': 58919, // sync
    }
  ];

  actionsEvent(int index) {
    print('index $index');
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
                      'Welcome to Flutter',
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
                            _list[index]['icon'],
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: true,
                          ),
                        ),
                        title: Text('${_list[index]['name']}'),
                      );
                    },
                    childCount: _list.length,
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

// RaisedButton(
//   child:
//       Text('当前为${model.config.state.isPro ? '线上' : '线下'}环境，点击进行切换'),
//   onPressed: () {
//     model.dispatch('config', 'setEnv');
//   },
// )
