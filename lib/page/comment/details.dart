import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/store/index.dart' show Store, UserModel;
import 'package:efox_flutter/store/objects/flutter_ui_issues.dart' show IssuesContent;
import 'package:efox_flutter/store/objects/issues_comment.dart' show IssuesDetails;
import 'package:efox_flutter/page/app_login/index.dart' as LoginIndex;

class Index extends StatefulWidget {
  int indexes;
  Index({ Key key, @required this.indexes }):super(key: key);
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final TextEditingController _controller = TextEditingController();
  var _getComment;
  bool isCanSend = false;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _getComment = this._getIssueComment(context);
    }

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
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: _ContentList(context),
          ),
          _SendComment(context)
        ],
      )
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
      future: _getComment,
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
    IssuesContent issuesContent = Store.valueNotCtx<UserModel>().flutter_ui_issues.issuesContent[widget.indexes];
    await Store.valueNotCtx<UserModel>().getIssueComment(issuesContent.number);
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

  Widget _SendComment (BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 0.5, color: Color(int.parse('0xffe4e4e4')))
          )
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _InputBox(),
            ),
            Store.connect<UserModel>(
              builder: (context, child, model) {
                IssuesContent issuesContent = model.flutter_ui_issues.issuesContent[widget.indexes];
                return GestureDetector(
                  onTap: () async {
                    if (isCanSend) {
                      if (model.user.id != null) {
                        print('发布内容：${_controller.text}');
                        bool isSendSuccess = await model.setIssueComment(
                          _controller.text,
                          issuesContent.number
                        );
                        if (isSendSuccess) {
                          await this._getIssueComment(context);
                          _controller.text = '';
                        } else {
                          print('网络错误');
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('网络出错，请稍后重试'),
                          ));
                        }
                      } else {
                        print('去往登陆');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return LoginIndex.Index();
                            }
                          )
                        );
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      '发布',
                      style: TextStyle(
                        color: isCanSend ? Theme.of(context).primaryColor : Colors.grey,
                        fontSize: 17
                      )
                    ),
                  ),
                );
              }
            )
          ],
        )
      ),
    );
  }
  Widget _InputBox() {
    return Container(
      height: 30,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: Color(int.parse('0xffEDEDED')),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextField(
              controller: _controller,
              autofocus: false,
              onChanged: _onChanged,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w300
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                border: InputBorder.none,
                hintText: '说点什么吧',
                hintStyle: TextStyle(fontSize: 15)
              ),
            ),
          )
        ],
      )
    );
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        isCanSend = true;
      });
    } else {
      setState(() {
        isCanSend = false;
      });
    }
  }
}