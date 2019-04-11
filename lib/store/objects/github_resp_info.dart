/**
 * github登录后返回的数据
 */
class GitHubRespInfo extends Object {
  num id;
  String url;
  App app;
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
    app = App.fromJson(json['app']);
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'app': app,
        'token': token,
        'hashed_token': hashed_token,
        'token_last_eight': token_last_eight,
        'note': note,
        'note_url': note_url,
        'created_at': created_at,
        'updated_at': updated_at,
        'scopes': scopes,
        'fingerprint': fingerprint,
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

  Map<String, dynamic> toJson() => {
        'str': str,
        'number': number,
        'boolean': boolean,
        'array': array,
        'map': map,
      };
}
