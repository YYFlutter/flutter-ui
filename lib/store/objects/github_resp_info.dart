/**
 * github登录后返回的数据
 */
class GitHubRespInfo extends Object {
  num id;
  String url;
  Map app;
  String token;
  String hashed_token;
  String token_last_eight;
  String note;
  Map note_url;
  String created_at;
  String updated_at;
  List scopes;
  Map fingerprint;

  GitHubRespInfo({
    this.id,
    this.url,
    this.app,
    this.token,
    this.hashed_token,
    this.token_last_eight,
    this.note,
    this.note_url,
    this.created_at,
    this.updated_at,
    this.scopes,
    this.fingerprint,
  });

  GitHubRespInfo.fromJson(json) {
    id = json['id'];
    url = json['url'];
    app = json['app'];
    token = json['token'];
    hashed_token = json['hashed_token'];
    token_last_eight = json['token_last_eight'];
    note = json['note'];
    note_url = json['note_url'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    scopes = json['scopes'];
    fingerprint = json['fingerprint'];
  }

  Map<String, dynamic> toJson(instance) => {
        'id': instance.id,
        'url': instance.url,
        'app': App.fromJson(instance.app),
        'token': instance.token,
        'hashed_token': instance.hashed_token,
        'token_last_eight': instance.token_last_eight,
        'note': instance.note,
        'note_url': instance.note_url,
        'created_at': instance.created_at,
        'updated_at': instance.updated_at,
        'scopes': instance.scopes,
        'fingerprint': instance.fingerprint,
      };
}

class App extends Object {
  String str;
  num number;
  bool boolean;
  List array;
  Map map;

  App({
    this.str,
    this.number,
    this.boolean,
    this.array,
    this.map,
  });

  App.fromJson(json) {
    str = json['str'];
    number = json['number'];
    boolean = json['boolean'];
    array = json['array'];
    map = json['map'];
  }

  Map<String, dynamic> toJson(instance) => {
        'str': instance.str,
        'number': instance.number,
        'boolean': instance.boolean,
        'array': instance.array,
        'map': instance.map,
      };
}
