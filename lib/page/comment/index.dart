import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/store/index.dart' show Store, UserModel;
import 'package:efox_flutter/store/objects/flutter_ui_issues.dart' show IssuesContent;
import 'package:efox_flutter/router/index.dart' show FluroRouter;

class Index extends StatefulWidget {
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
          AppLocalizations.$t('title_comment')
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16.0, 0 ,16.0, 0),
        child: _CommentList(context),
      )
    );
  }

  Widget _CommentList(BuildContext context){
    return Store.connect<UserModel>(
      builder: (context, child, model) {
        if (model.flutter_ui_issues!=null&&model.flutter_ui_issues.issuesContent!=null&&model.flutter_ui_issues.issuesContent.length!=0) {
          return ListView.builder(
            itemCount: model.flutter_ui_issues.issuesContent.length,
            itemBuilder: (context, index) {
              return _CommentCard(context, model.flutter_ui_issues.issuesContent[index], index);
            },
          );
        } else {
          return Center(
            child: Text('loading....'),
          );
        }
      }
    );
  }

  Widget _CommentCard(BuildContext context, IssuesContent issuesContent, int index) {
    return GestureDetector(
      onTap: () {
        // Store.value<UserModel>(context).getIssueComment(issuesContent.number);
        FluroRouter.router.navigateTo(context, '/commentdetails?indexes=${index}',);
      },
      child: Card(
        elevation: 4.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16/9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.0),
                      topRight: Radius.circular(6.0),
                      bottomLeft: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0)
                    ),
                    child: Image.network(
                      issuesContent.user.avatarUrl??'http://thumb10.jfcdns.com/2018-06/bce5b10ae530f530.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                  child: Text(
                    '${issuesContent.title != '' ? issuesContent.title : '无标题'} #${issuesContent.number}',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 10, 20, 0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '创建时间：${issuesContent.createdAt}',
                        style: TextStyle(color: Colors.black54, fontSize: 12)
                      ),
                      Text(
                        '更新时间：${issuesContent.updatedAt}',
                        style: TextStyle(color: Colors.black54, fontSize: 12)
                      )
                    ],
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 10, 20, 20.0),
                  child: Text(
                    issuesContent.body,
                    //  != '' ?issuesContent.body:'无主体内容'
                    style: Theme.of(context).textTheme.subhead
                  ),
                )
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                issuesContent.user.login,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}