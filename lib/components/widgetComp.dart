import 'package:flutter/material.dart';
import 'package:efox_flutter/store/index.dart' show Store;
import 'package:efox_flutter/components/markdownComp.dart' as MarkDownComp;
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/components/baseComp.dart' as BaseComp;
import 'package:efox_flutter/components/exampleComp.dart' as ExampleComp;
import 'package:efox_flutter/components/updatingComp.dart' as UpdatingComp;
import 'package:efox_flutter/utils/file.dart' as FileUtils;
import 'package:efox_flutter/utils/loadAsset.dart' as LoadAssetUtils;
import 'package:efox_flutter/router/index.dart' show FluroRouter;
import 'package:efox_flutter/config/theme.dart' show AppTheme;
import 'package:efox_flutter/utils/share.dart' as AppShare;
import 'package:efox_flutter/widget/author_list.dart' as AuthorList;
import 'package:efox_flutter/store/objects/author_info.dart' show AuthorInfo;

class Index extends StatefulWidget {
  final List<Widget> demoChild;
  final String originCodeUrl;
  final String mdUrl;
  final String title;
  Index({
    Key key,
    this.title,
    this.demoChild,
    this.originCodeUrl,
    this.mdUrl,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<Index> {
  List<Widget> _bodyList = [];
  bool loading = true;
  dynamic model;

  @override
  void initState() {
    super.initState();
    this.init();
  }

  authorTile(nameKey) {
    AuthorInfo info = this.model.author.state[nameKey];
    return Container(
      child: ListTile(
        onTap: () {
          FluroRouter.router.navigateTo(context,
              '/webview?title=${'GitHub-' + info.name}&url=${Uri.encodeComponent(info.url)}');
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            info.avatarUrl,
          ),
          radius: 35,
        ),
        title: Text(
          info.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          info.url,
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Color(AppTheme.mainColor),
        ),
      ),
    );
  }

  void init() async {
    this._bodyList.length = 0;
    String mdText = await this.getMdFile(widget.mdUrl);
    String nameKey = AuthorList.list[widget.title];
    print('name $nameKey');
    if (nameKey != null) {
      this._bodyList.add(authorTile(nameKey));
      this._bodyList.add(Divider());
    }
    if (mdText.length > 30 || !this.model.config.state.isPro) {
      this._bodyList.add(await MarkDownComp.Index(mdText));
      // demo
      if (widget.demoChild != null && widget.demoChild.length > 0) {
        widget.demoChild.forEach((Widget item) {
          this._bodyList.add(ExampleComp.Index(child: item));
        });
      }
    } else {
      this._bodyList.add(UpdatingComp.Index());
    }
    setState(() {
      this.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Store.connect(builder: (context, child, model) {
      this.model = model;
      return Scaffold(
        appBar: AppBar(
          //title: Text(this.title),
          elevation: 0,
          backgroundColor: Color(AppTheme.secondColor),
          actions: this.getActions(
            context,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            //color: Theme.of(context).primaryTextTheme.title.color,
            color: Color(AppTheme.blackColor),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: this.loading ? this.renderLoading() : this.renderWidget(),
      );
    });
  }

  openPage(context) async {
    String url = widget.mdUrl;
    // 加载页面
    if (this.model.config.state.isPro) {
      FluroRouter.router.navigateTo(context,
          '/webview?title=${widget.title}&url=${Uri.encodeComponent(this.model.config.state.env.githubAssetOrigin + url.replaceAll(RegExp('/index.md'), '').replaceAll('docs', 'lib'))}');
    } else {
      // 加载本地
      String mdStr = await FileUtils.readLocaleFile(url);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return BaseComp.Index(
            title: widget.title,
            child: (context, child, model) {
              return MarkDownComp.Index(mdStr);
            },
          );
        }),
      );
    }
  }

  Future getMdFile(url) async {
    String mdStr = (await LoadAssetUtils.loadMarkdownAssets(url)).toString();
    return mdStr;
  }

  getActions(context) {
    return [
      IconButton(
        //color: Theme.of(context).primaryTextTheme.title.color,
        color: Color(AppTheme.blackColor),
        icon: Icon(
          Icons.insert_link,
        ),
        onPressed: () async {
          FluroRouter.router.navigateTo(
            context,
            '/webview?title=${widget.title}&url=${Uri.encodeComponent(widget.originCodeUrl)}',
          );
        },
      ),
      /* IconButton(
        icon: Icon(
          Icons.code,
        ),
        onPressed: () async {
          this.openPage(context);
        },
      ), */
      IconButton(
        icon: Icon(Icons.share),
        //color: Theme.of(context).primaryTextTheme.title.color,
        color: Color(AppTheme.blackColor),
        onPressed: () {
          final String msg =
              this.model.config.state.env.githubAssetOrigin + widget.mdUrl;
          AppShare.shareText(msg);
        },
      ),
    ];
  }

  Widget renderLoading() {
    return Center(
      child: Stack(
        children: <Widget>[
          // 遮罩
          Opacity(
            opacity: .8,
            child: ModalBarrier(
              color: Colors.black87,
            ),
          ),
          // 居中显示
          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(
                    strokeWidth: 4,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                    child: Text(
                      AppLocalizations.$t('loading'),
                      style: TextStyle(
                          color: Color(AppTheme.secondColor), fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderWidget() {
    // 加载完成后返回页面
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: this._bodyList,
      ),
    );
  }
}
