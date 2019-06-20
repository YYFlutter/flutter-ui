import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/store/index.dart' show Store, UserModel;

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  TextEditingController nameCtl = TextEditingController(text: '');
  TextEditingController pwdCtl = TextEditingController(text: '');

  GlobalKey _formKey = GlobalKey<FormState>();
  OverlayState _overlayState;
  OverlayEntry _overlayEntry;

  /**
   * 弹窗内容
   */
  renderOverlay(String text) {
    _overlayEntry?.remove();
    _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return Center(child: Text(text));
    });
    _overlayState.insert(_overlayEntry);
  }

  /**
   * 顶部图标
   */
  renderGithubImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/imgs/github_2.png',
          width: 50,
          height: 50,
        ),
        SizedBox(
          width: 10,
        ),
        Transform.rotate(
          child: Icon(
            Icons.import_export,
            color: Colors.black,
          ),
          angle: math.pi / 2,
        ),
        SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/imgs/github_1.png',
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext ctx) {
    // return WillPopScope(
    //   child: ,
    //   onWillPop: () {
    //     beforeDispose();
    //   },
    // );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.$t('common.login'),
          textAlign: TextAlign.center,
        ),
        // automaticallyImplyLeading: false,
      ),
      body: Builder(builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  renderGithubImage(),
                  TextFormField(
                    controller: nameCtl,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.$t('login.account'),
                      hintText: AppLocalizations.$t('login.account_tips'),
                      icon: Icon(Icons.person),
                    ),
                    validator: (v) {
                      return v.trim().length > 0
                          ? null
                          : AppLocalizations.$t('login.account_error_tips');
                    },
                  ),
                  TextFormField(
                    controller: pwdCtl,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.$t('login.password'),
                      hintText: AppLocalizations.$t('login.password_tips'),
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (v) {
                      return v.trim().length > 0
                          ? null
                          : AppLocalizations.$t('login.password_error_tips');
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(15),
                            color: Theme.of(context).primaryColor,
                            textColor:
                                Theme.of(context).primaryTextTheme.title.color,
                            child: Text(
                              AppLocalizations.$t('common.login'),
                            ),
                            onPressed: () async {
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                await Store.value<UserModel>(context)
                                    .loginController(context, {
                                  'name': nameCtl.text.trim(),
                                  'pwd': pwdCtl.text.trim()
                                });
                                await Store.value<UserModel>(context)
                                    .getUserStar();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          'Github账户登录说明',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            textBaseline: TextBaseline.ideographic,
                            decorationColor: Color(0xff000000),
                          ),
                        ),
                        onTap: () {
                          renderOverlay(" Text 1");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Text(
                          '软件许可及服务协议',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            textBaseline: TextBaseline.ideographic,
                            decorationColor: const Color(0xff000000),
                          ),
                        ),
                        onTap: () {
                          renderOverlay(" Text 2");
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  beforeDispose() {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    } else {
      Navigator.of(context).pop();
    }
  }
}
