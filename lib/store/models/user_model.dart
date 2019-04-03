import 'package:dio/dio.dart' show Options;
import '../objects/user_info.dart' show UserInfo;
import '../objects/github_resp_info.dart' show GitHubRespInfo;
import 'package:efox_flutter/http/index.dart' as Http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:efox_flutter/utils/localStorage.dart' show LocalStorage;
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  UserInfo user = UserInfo();
  /**
   * 登录控制
   */
  Future $loginController(context, payload) async {
    dynamic result = await $login(payload);
    if (result == true) {
      Navigator.of(context).pop();
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('登录失败'),
      ));
    }
  }

  Future $login(payload) async {
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
      await $setLoginRespInfo(resp.data);
      return true;
    }).catchError((error) {
      $clearUserInfo();
      return false;
    });
  }

  $setLoginRespInfo(payload) async {
    GitHubRespInfo user = GitHubRespInfo.fromJson(payload);
    LocalStorage.set('githubRespInfo', user.toString());
    print('user.token.toString() ${user.token.toString()}');
    LocalStorage.set('githubRespLoginToken', user.token.toString());
    await $getUserInfo(); // 授权成功获取用户信息
  }

  /**
   * 授权成功或打开app时获取用户信息
   */
  Future $getUserInfo() async {
    var response = Http.post(
      url: 'https://api.github.com/user',
    );
    await response.then((resp) {
      UserInfo user = UserInfo.fromJson(resp.data);
      $setUserInfo(user);
    }).catchError((error) {
      print('ERROR $error');
      // $clearUserInfo();
    });
  }

  /**
   * 获取本地数据，减少调用接口
   */
  $getLocalUserInfo() async {
    String data = await LocalStorage.get('githubUserInfo');
    if (data == null) {
      $getUserInfo();
      return;
    }
    UserInfo user = UserInfo.fromJson(data);
    $setUserInfo(user);
  }

  /**
   * 设置用户信息
   */
  $setUserInfo(payload) {
    user = payload;
    LocalStorage.set('githubUserInfo', json.encode(payload));
    notifyListeners();
  }

  /**
   * 清空用户信息
   */
  $clearUserInfo() {
    user = UserInfo();
    LocalStorage.remove('githubRespInfo');
    LocalStorage.remove('githubRespLoginToken');
    notifyListeners();
  }
}
