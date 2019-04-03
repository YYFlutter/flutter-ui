import 'package:flutter/material.dart';
import 'package:efox_flutter/components/markdown_comp.dart' as markdown_comp;
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/components/example_comp.dart' as example_comp;
import 'package:efox_flutter/components/updating_comp.dart' as updating_comp;
import 'package:efox_flutter/utils/loadAsset.dart' as AssetUtils;
import 'package:efox_flutter/router/index.dart' show FluroRouter;
import 'package:efox_flutter/config/theme.dart' show AppTheme;
import 'package:efox_flutter/utils/share.dart' as AppShare;
import 'package:efox_flutter/widget/author_list.dart' as AuthorList;
import 'package:efox_flutter/store/objects/author_info.dart' show AuthorInfo;
import 'package:efox_flutter/store/index.dart' show AuthorModel, ConfigModel, Store;

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
    AuthorInfo info = Store.value<AuthorModel>(context).list[nameKey];
    return Container(
      child: ListTile(
        onTap: () {
          FluroRouter.webview(context: context, title: 'GitHub-' + info.name, url: Uri.encodeComponent(info.url));
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
    if (nameKey != null) {
      this._bodyList.add(authorTile(nameKey));
      this._bodyList.add(Divider());
    }
    print('文档完成长度：${mdText.length}');
    if (mdText.length > 30) {
      this._bodyList.add(await markdown_comp.Index(mdText));
      // demo
      if (widget.demoChild != null && widget.demoChild.length > 0) {
        widget.demoChild.forEach((Widget item) {
          this._bodyList.add(example_comp.Index(child: item));
        });
      }
    } else {
      this._bodyList.add(updating_comp.Index());
    }
    setState(() {
      this.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
        print('widget_comp context  =$context');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(AppTheme.secondColor),
        actions: this.getActions(
          context,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(AppTheme.blackColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: this.loading ? this.renderLoading() : this.renderWidget(),
    );
  }

  Future getMdFile(url) async {
    // bool productionEnv = Store.value<ConfigModel>(context).isPro;
    bool productionEnv = false;
    if (productionEnv) {
      return await AssetUtils.readRemoteFile(url);
    } else {
      return await AssetUtils.readLocaleFile(url);
    }
  }

  getActions(context) {
    return [
      IconButton(
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
      IconButton(
        icon: Icon(Icons.share),
        color: Color(AppTheme.blackColor),
        onPressed: () {
          dynamic origin =
              Store.value<ConfigModel>(context).env.githubAssetOrigin;
          AppShare.shareText(origin + widget.mdUrl);
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
