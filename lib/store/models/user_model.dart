import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:dio/dio.dart' show Options;
import '../objects/user_info.dart' show UserInfo;
import '../objects/github_resp_info.dart' show GitHubRespInfo;
import 'package:efox_flutter/http/index.dart' as Http;
import 'package:efox_flutter/utils/localStorage.dart' show LocalStorage;
import 'package:efox_flutter/config/index.dart' show owner_repo;
import '../objects/flutter_ui_info.dart' show FlutterUiInfo;
import '../objects/flutter_ui_issues.dart' show FlutterUiIssues;
import '../objects/issues_comment.dart' show IssuesComment;

class UserModelInfo {
  bool isStar = false;  // 用户是否star了flutter ui项目
  FlutterUiInfo flutter_ui_info = FlutterUiInfo(); // flutter ui项目信息
  FlutterUiIssues flutter_ui_issues = FlutterUiIssues(); // flutter ui的issues内容
  IssuesComment issues_comment = IssuesComment(); // issues comment内容
}

class UserModel extends UserModelInfo with ChangeNotifier {
  UserInfo user = UserInfo();
  Future testLogin() async {
    return await Http.post(url: 'http://www.baidu.com').then((res) {
      return true;
    }).catchError((error) async {
      return await getUserInfo();
    });
  }

  /**
   * 登录控制
   */
  Future loginController(context, payload) async {
    dynamic result = await login(payload);
    // dynamic result = await testLogin();
    print('返回result $result');
    if (result == true) {
      print('登录成功后退');
      Navigator.of(context).pop();
    } else {
      print('登录失败');
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('登录失败'),
      ));
    }
  }

  Future login(payload) async {
    var name = payload['name'];
    var pwd = payload['pwd'];
    var bytes = utf8.encode("$name:$pwd");
    var credentials = base64.encode(bytes);
    const data = {
      "scopes": ["user", "repo", "gist", "notifications", "public_repo"],
      "note": "admin_script",
      "client_id": "d8eef6133f1a2be3a842",
      "client_secret": "2b005eed01c72aefd68fac5c5c7f2654f81c227a"
    };
    Options options = Options(headers: {'Authorization': 'Basic $credentials'});
    var response = Http.post(
      url: 'https://api.github.com/authorizations',
      data: data,
      options: options,
    );
    return await response.then((resp) async {
      return await setLoginRespInfo(resp.data);
    }).catchError((error) {
      clearUserInfo();
      return false;
    });
  }

  setLoginRespInfo(payload) async {
    GitHubRespInfo user = GitHubRespInfo.fromJson(payload);
    LocalStorage.set('githubRespInfo', user.toString());
    print('user.token.toString() ${user.token.toString()}');
    LocalStorage.set('githubRespLoginToken', user.token.toString());
    return await getUserInfo(); // 授权成功获取用户信息
  }

  /**
   * 授权成功或打开app时获取用户信息
   */
  Future getUserInfo() async {
    var response = Http.post(
      url: 'https://api.github.com/user',
    );
    return await response.then((resp) {
      UserInfo user = UserInfo.fromJson(resp.data);
      setUserInfo(user);
      return true;
    }).catchError((error) {
      print('ERROR $error');
      return false;
    });
  }

  /**
   * 获取本地数据，减少调用接口
   */
  getLocalUserInfo() async {
    String data = await LocalStorage.get('githubUserInfo');
    print("本地数据 $data");
    if (data != null) {
      UserInfo user = UserInfo.fromJson(json.decode(data));
      setUserInfo(user);
      return true;
    }
    if (data == null) {
      return await getUserInfo();
    }
  }

  /**
   * 设置用户信息
   */
  setUserInfo(payload) {
    user = payload;
    if (user != null && user.id != null) {
      LocalStorage.set('githubUserInfo', json.encode(user));
    }
    notifyListeners();
  }

  /**
   * 清空用户信息
   */
  clearUserInfo() {
    user = UserInfo();
    LocalStorage.remove('githubUserInfo');
    LocalStorage.remove('githubRespInfo');
    LocalStorage.remove('githubRespLoginToken');
    notifyListeners();
  }

  /**
   * 修改star显示
   */
  changeIsStar(isShow){
    isStar = isShow;
    notifyListeners();
  }

  /**
   * 获取flutter ui star数量
   */
  getFlutterUIStar() {
    var response = Http.get(
      url: 'https://api.github.com/repos/$owner_repo'
    );
    response.then((resp) {
      print('获取flutter ui信息：$resp');
      flutter_ui_info= FlutterUiInfo.fromJson(resp.data);
      notifyListeners();
    }).catchError((error) {
      print('获取flutter ui信息出错：$error');
    });
  }

  /**
   * 获取用户的star flutter ui信息
   */
  getUserStar() async {
    var response = Http.get(
      url: 'https://api.github.com/user/starred/$owner_repo'
    );
    response.then((resp) {
      print('用户的star信息状态码：${resp.statusCode}');
      if (resp.statusCode == 204) {
        // TODO user have focused the repository
        isStar = true;
        notifyListeners();
        return ;
      }
      if (resp.statusCode == 404) {
        // TODO user have not focused the repository
        isStar = false;
        notifyListeners();
        return;
      }
    }).catchError((error) {
      print('获取用户star信息出错$error');
      if (error.statusCode == 404) {
        // TODO user have not focused the repository
        isStar = false;
        notifyListeners();
      }
    });
  }

  /**
   * 用户star flutter ui项目
   */
  setStarFlutterUI() {
    var response = Http.put(
      url: 'https://api.github.com/user/starred/$owner_repo'
    );
    response.then((resp) {
      print('用户star flutter ui项目状态码: ${resp.statusCode}');
      if (resp.statusCode == 204) {
        // star success
        getFlutterUIStar();
        getUserStar();
      }
    }).catchError((error) {
      print('用户star flutter ui项目错误: $error');
    });
  }

  /**
   * 获取flutter ui的issue内容
   */
  getIssueFlutterUI() {
    var response = Http.get(
      url: 'https://api.github.com/repos/$owner_repo/issues'
    );
    response.then((resp) {
      var data = {
        "issues_content": resp.data
      };
      print('获取flutter ui的issue内容:${data}');
      flutter_ui_issues = FlutterUiIssues.fromJson(data);
      notifyListeners();
      return flutter_ui_issues;
    }).catchError((error) {
      print('获取flutter ui的issue内容出错：$error');
    });
  }

  /**
   * 获取对应issue下的回复内容
   */
  getIssueComment(int number) async {
    var response = await Http.get(
      url: 'https://api.github.com/repos/$owner_repo/issues/$number/comments'
    );
    try {
      var data = {
        "issues_details": response.data
      };
      print('获取对应issue下的回复内容:${response.data}');
      issues_comment = IssuesComment.fromJson(data);
      notifyListeners();
    } catch(error) {
      print('获取对应issue下的回复内容出错：$error');
    }
  }

  /**
   * 回复issue评论
   */
  setIssueComment(String text, int number) async {
    var data = {
      "body": "$text"
    };
    var response = await Http.post(
      url: 'https://api.github.com/repos/$owner_repo/issues/$number/comments',
      data: data
    );
    try {
      print('回复issue评论状态码：${response.statusCode}');
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('回复issue评论出错：$error');
      return false;
    }
  }
}
