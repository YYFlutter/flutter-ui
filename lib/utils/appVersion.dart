import 'dart:io';
import 'dart:convert';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:efox_flutter/store/http.dart' as Http;
import 'package:flutter/material.dart';

class AppVersion {
  var _context;
  Future<bool> _checkPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  // 获取安装地址
  Future<String> get _apkLocalPath async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<Null> check(context, {showTips: false}) async {
    _context = context;
    if (!Platform.isAndroid) return;
    // permission Status
    bool _permissisonReady = await this._checkPermission();
    if (!_permissisonReady) return;
    //
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String platform = Platform.isAndroid ? 'android' : 'ios';
    print('version=$version $platform');
    Map d = await checkVersion(version, platform);
    print(d);
    if (d['isNew']) {
      this._showDialog(context, d);
    } else if (showTips) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('已经是最新版本'),
      ));
    }
  }

  void _showDialog(context, d) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('升级提示'),
            content: Text('发现新版本 ${d['version']}'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('确定'),
                onPressed: () async {
                  await _downAndInstall(d['version']);
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  Future checkVersion(String version, String platform) async {
    var res = await Http.get(
        'https://raw.githubusercontent.com/efoxTeam/flutter-ui/master/version.json');
    res = json.decode(res);
    print('res=${res['version']}');
    String newVersion = (res['version'] != null) ? res['version'] : version;
    //newVersion = '1.0.1'; //debug code
    print('$newVersion $res $version');
    bool isNewestVersion = (newVersion == version) ? false : true;
    Map<String, dynamic> d = {
      'version': newVersion,
      'isNew': isNewestVersion,
      'platform': platform
    };
    return Future.value(d);
  }

  Future _downAndInstall(String version) async {
    String _finalApkPath = await _apkLocalPath;
    String fileName = 'app-release.apk';
    final taskId = await FlutterDownloader.enqueue(
      url:
          'https://github.com/efoxTeam/flutter-ui/releases/download/v$version/$fileName',
      savedDir: _finalApkPath,
      fileName: fileName,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
    await FlutterDownloader.loadTasks();
    FlutterDownloader.registerCallback((id, status, progress) {
      print(
          'Download task ($id) is in status ($status) and process ($progress) status ${DownloadTaskStatus.complete} _finalApkPath=$_finalApkPath');
      if (taskId == id && status == DownloadTaskStatus.complete) {
        OpenFile.open(_finalApkPath);
        FlutterDownloader.open(taskId: id);
      }
    });
  }
}
