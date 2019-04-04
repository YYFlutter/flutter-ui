import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:dio/dio.dart' show Options;
import '../objects/user_info.dart' show UserInfo;
import '../objects/github_resp_info.dart' show GitHubRespInfo;
import 'package:efox_flutter/http/index.dart' as Http;
import 'package:efox_flutter/utils/localStorage.dart' show LocalStorage;
import 'package:efox_flutter/http/loading.dart' as Loading;

class UserModel with ChangeNotifier {
  UserInfo user = UserInfo();
  Future testLogin() async {
    await Loading.beforeRequest('aaa', {});
    return Future.delayed(Duration(seconds: 3), () async {
      await Loading.afterResponse('aaa', {});
      print("返回中");
      return true;
    });
  }

  /**
   * 登录控制
   */
  Future $loginController(context, payload) async {
    dynamic result = await $login(payload);
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
    print("本地数据 $data");
    if (data == null) {
      $getUserInfo();
      return;
    }
    UserInfo user = UserInfo.fromJson(json.decode(data));
    $setUserInfo(user);
  }

  /**
   * 设置用户信息
   */
  $setUserInfo(payload) {
    user = payload;
    if (user != null && user.id != null) {
      LocalStorage.set('githubUserInfo', json.encode(user));
    }
    notifyListeners();
  }

  /**
   * 清空用户信息
   */
  $clearUserInfo() {
    user = UserInfo();
    LocalStorage.remove('githubUserInfo');
    LocalStorage.remove('githubRespInfo');
    LocalStorage.remove('githubRespLoginToken');
    notifyListeners();
  }
}
