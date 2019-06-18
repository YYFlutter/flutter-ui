class IssuesComment {
  List<IssuesDetails> issuesDetails;

  IssuesComment({this.issuesDetails});

  IssuesComment.fromJson(Map<String, dynamic> json) {
    if (json['issues_details'] != null) {
      issuesDetails = new List<IssuesDetails>();
      json['issues_details'].forEach((v) {
        issuesDetails.add(new IssuesDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.issuesDetails != null) {
      data['issues_details'] =
          this.issuesDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IssuesDetails {
  String url;
  String htmlUrl;
  String issueUrl;
  int id;
  String nodeId;
  User user;
  String createdAt;
  String updatedAt;
  String authorAssociation;
  String body;

  IssuesDetails(
      {this.url,
      this.htmlUrl,
      this.issueUrl,
      this.id,
      this.nodeId,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.authorAssociation,
      this.body});

  IssuesDetails.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    issueUrl = json['issue_url'];
    id = json['id'];
    nodeId = json['node_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authorAssociation = json['author_association'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['issue_url'] = this.issueUrl;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['author_association'] = this.authorAssociation;
    data['body'] = this.body;
    return data;
  }
}

class User {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  User(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['avatar_url'] = this.avatarUrl;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['site_admin'] = this.siteAdmin;
    return data;
  }
}

// {
//   "issues_details": [
// {
// "url": "https://api.github.com/repos/efoxTeam/flutter-ui/issues/comments/500342145",
// "html_url": "https://github.com/efoxTeam/flutter-ui/issues/53#issuecomment-500342145",
// "issue_url": "https://api.github.com/repos/efoxTeam/flutter-ui/issues/53",
// "id": 500342145,
// "node_id": "MDEyOklzc3VlQ29tbWVudDUwMDM0MjE0NQ==",
// "user": {
// "login": "DIVINER-onlys",
// "id": 35843543,
// "node_id": "MDQ6VXNlcjM1ODQzNTQz",
// "avatar_url": "https://avatars0.githubusercontent.com/u/35843543?v=4",
// "gravatar_id": "",
// "url": "https://api.github.com/users/DIVINER-onlys",
// "html_url": "https://github.com/DIVINER-onlys",
// "followers_url": "https://api.github.com/users/DIVINER-onlys/followers",
// "following_url": "https://api.github.com/users/DIVINER-onlys/following{/other_user}",
// "gists_url": "https://api.github.com/users/DIVINER-onlys/gists{/gist_id}",
// "starred_url": "https://api.github.com/users/DIVINER-onlys/starred{/owner}{/repo}",
// "subscriptions_url": "https://api.github.com/users/DIVINER-onlys/subscriptions",
// "organizations_url": "https://api.github.com/users/DIVINER-onlys/orgs",
// "repos_url": "https://api.github.com/users/DIVINER-onlys/repos",
// "events_url": "https://api.github.com/users/DIVINER-onlys/events{/privacy}",
// "received_events_url": "https://api.github.com/users/DIVINER-onlys/received_events",
// "type": "User",
// "site_admin": false
// },
// "created_at": "2019-06-10T08:51:54Z",
// "updated_at": "2019-06-10T08:51:54Z",
// "author_association": "NONE",
// "body": "ooooo"
// }
// ]
// }