import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/store/index.dart' show Store, UserModel;
import 'package:efox_flutter/store/objects/flutter_ui_issues.dart' show IssuesContent;
import 'package:efox_flutter/store/objects/issues_comment.dart' show IssuesDetails;

class Index extends StatefulWidget {
  int indexes;
  Index({ Key key, @required this.indexes }):super(key: key);
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.$t('title_comment_detials')
        ),
      ),
      body: Container(
        child: _ContentList(context)
      ),
    );
  }

  Widget _ContentList (BuildContext context) {
    return ListView(
      children: <Widget>[
        _IssueContent(context),
        _CommentContent(context)
      ],
    );
  }

  Widget _IssueContent (BuildContext context) {
    return Store.connect<UserModel>(
      builder: (context, child, model) {
        IssuesContent issuesContent = model.flutter_ui_issues.issuesContent[widget.indexes];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  issuesContent.user.avatarUrl??'http://thumb10.jfcdns.com/2018-06/bce5b10ae530f530.png',
                ),
              ),
              title: Text('${issuesContent.user.login}'),
              subtitle: Text('更新时间：${issuesContent.updatedAt}'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 20, 20, 0),
              child: Text(
                '${issuesContent.title != '' ? issuesContent.title : '无标题'} #${issuesContent.number}',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 10, 20, 20.0),
              child: Text(
                issuesContent.body,
                //  != '' ?issuesContent.body:'无主体内容'
                style: Theme.of(context).textTheme.subhead
              ),
            ),
            Divider(
              height: 1,
            )
          ],
        );
      }
    );
  }

  Widget _CommentContent (BuildContext context) {
    return FutureBuilder(
      future: _getIssueComment(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text('loading....'),
            ),
          );
        } else if(snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Store.connect<UserModel>(
              builder: (context, child, model) {
                List<Widget> items = [];
                for(var issuesDetails in model.issues_comment.issuesDetails) {
                  items.add(_CommentContentItem(context, issuesDetails));
                }
                return Column(
                  children: items,
                );
              }
            );
          } else {
            return Center(
              child: Text('暂无数据'),
            );
          }
        }
      },
    );
  }

  Future<String> _getIssueComment(BuildContext context) async {
    IssuesContent issuesContent = Store.value<UserModel>(context).flutter_ui_issues.issuesContent[widget.indexes];
    await Store.value<UserModel>(context).getIssueComment(issuesContent.number);
    return 'end';
  }

  Widget _CommentContentItem(BuildContext context, IssuesDetails issuesDetails) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                issuesDetails.user.avatarUrl??'http://thumb10.jfcdns.com/2018-06/bce5b10ae530f530.png',
              ),
            ),
            title: Text('${issuesDetails.user.login}'),
            subtitle: Text('${issuesDetails.body}')
          ),
          Divider(height: 1,)
        ],
      ),
    );
  }
}