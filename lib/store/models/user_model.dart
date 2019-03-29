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
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('登录成功'),
      ));
      Navigator.of(context).pop();
    } else {
      print('response $result');
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
      "note": "admin_script2",
      "client_id": "d8eef6133f1a2be3a842",
      "client_secret": "2b005eed01c72aefd68fac5c5c7f2654f81c227a"
    };
    Options options = Options(headers: {'Authorization': 'Basic $credentials'});
    var response = await Http.post(
      url: 'https://api.github.com/authorizations',
      data: data,
      options: options,
    );
    if (response['data'] != null) {
      $setLoginRespInfo(response['data']);
      return true;
    } else {
      // $clearUserInfo();
      return response;
    }
  }

  $setLoginRespInfo(payload) {
    GitHubRespInfo user = GitHubRespInfo.fromJson(payload);
    LocalStorage.set('githubRespInfo', user.toString());
    LocalStorage.set('githubRespLoginToken', user.token.toString());
    $getUserInfo(); // 授权成功获取用户信息
  }

  /**
   * 授权成功或打开app时获取用户信息
   */
  Future $getUserInfo() async {
    var response = await Http.post(
      url: 'https://api.github.com/user',
    );
    if (response['data'] != null) {
      UserInfo user = UserInfo.fromJson(response['data']);
      $setUserInfo(user);
    } else {
      $clearUserInfo();
    }
  }

  /**
   * 设置用户信息
   */
  $setUserInfo(payload) {
    user = payload;
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
