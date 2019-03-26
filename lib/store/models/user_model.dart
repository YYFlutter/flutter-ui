import 'package:dio/dio.dart' show Options;
import '../objects/user_info.dart' show UserInfo;
import 'package:efox_flutter/store/http.dart' as Http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show ChangeNotifier;

Map<String, String> Url = {'login': 'https://api.github.com/authorizations'};

class UserModel extends UserInfo with ChangeNotifier  {
  setUser(payload) {
    name = payload['name'];
    notifyListeners();
  }

  Future login(payload) async {
    var name = payload['name'];
    var pwd = payload['pwd'];
    var bytes = utf8.encode("$name:$pwd");
    var credentials = base64.encode(bytes);
    var response = await Http.post(
        Url['login'],
        {
          "scopes": ["user", "repo", "gist", "notifications", "public_repo"],
          "note": "admin_script",
        },
        {},
        Options(headers: {'Authorization': 'Basic $credentials'})).then((res) {
      print('success ==$res');
    }).catchError((err) {
      print('error -------------- ${err.response}');
      print('error -------------- ${err.request.data}');
      print('error -------------- ${err.request.headers}');
    });
    print('response =---------------------');
    print(response);
  }

}
