class UserInfo extends Object{
  String fbid;
  String uid;
  String name;
  String token;
  String avatar;
  int expiresIn;
  int expireTime;
  bool loading;
  int age;

  //
  UserInfo(
      {this.fbid,
      this.uid,
      this.name,
      this.token,
      this.expiresIn,
      this.age = 0,
      this.loading = false,
      this.expireTime = 0});
  //
  UserInfo.fromJson(json) {
    Map user = json['user'];
    fbid = user['fbid'];
    uid = user['uid'];
    name = user['name'];
    avatar = user['avatar'];
    token = json['token'];
    expiresIn = json['expiresIn'] ?? 0;
    if (expiresIn >= 0) {
      int now = DateTime.now().millisecondsSinceEpoch;
      expireTime = now + expiresIn * 1000;
    }
  }

  Map<dynamic, dynamic> toJson(UserInfo instance) => <String, dynamic>{
        'user': <String, dynamic>{
          'fbid': instance.fbid,
          'uid': instance.uid,
          'name': instance.name,
          'avatar': instance.avatar,
        },
        'token': instance.token,
        'expiresIn': instance.expiresIn,
        'expireTime': instance.expireTime,
      };
}
