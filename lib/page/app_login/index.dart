import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.$t('common.login'),
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Builder(builder: (BuildContext context) {
        // Store.setWidgetCtx(context);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameCtl,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.$t('login.account'),
                      hintText: AppLocalizations.$t('login.account_tips'),
                      icon: Icon(Icons.person),
                    ),
                    validator: (v) {
                      return v.trim().length > 0 ? null : AppLocalizations.$t('login.account_error_tips');
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
                      return v.trim().length > 0 ? null : AppLocalizations.$t('login.password_error_tips');
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
                                Store.value<UserModel>(context)
                                    .$loginController(context, {
                                  'name': nameCtl.text,
                                  'pwd': pwdCtl.text
                                });
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
}
