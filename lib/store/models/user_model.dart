import 'package:dio/dio.dart' show Options;
import '../objects/user_info.dart' show UserInfo;
import '../objects/github_resp_info.dart' show GitHubRespInfo;
import 'package:efox_flutter/store/http.dart' as Http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:efox_flutter/utils/localStorage.dart' show LocalStorage;

class UserModel with ChangeNotifier {
  UserInfo user = UserInfo();
  $setUserInfo(payload) {
    user = payload;
    notifyListeners();
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
    var response = await Http.post(
      url: 'https://api.github.com/authorizations',
      data: data,
      options: options,
    );

    GitHubRespInfo user = GitHubRespInfo.fromJson(response);
    print('GitHubRespInfo $user');
    await LocalStorage.set('githubRespInfo', response.toString());
    await LocalStorage.set('githubRespLoginToken', user.token.toString());
    await $getUserInfo();
  }

  /**
   * 获取用户信息
   */
  Future $getUserInfo() async {
    var response = await Http.post(
      url: 'https://api.github.com/user',
    );
    UserInfo user = UserInfo.fromJson(response);
    $setUserInfo(user);
  }

  /**
   * 校验登录态
   */
  Future $checkAuthentication() async {
    String token = await LocalStorage.get('githubRespLoginToken');
    if (token == null) {
      return false;
    }
    ;
    const client_id = 'd8eef6133f1a2be3a842';
    var response = await Http.get(
        url: 'https://api.github.com/applications/$client_id/tokens/$token');
    print('response ${response} ${response['code']} ${response['msg']}');
    return true;
  }
}
