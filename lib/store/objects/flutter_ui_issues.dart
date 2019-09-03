class FlutterUiIssues {
  List<IssuesContent> issuesContent;

  FlutterUiIssues({this.issuesContent});

  FlutterUiIssues.fromJson(Map<String, dynamic> json) {
    if (json['issues_content'] != null) {
      issuesContent = new List<IssuesContent>();
      json['issues_content'].forEach((v) {
        issuesContent.add(new IssuesContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.issuesContent != null) {
      data['issues_content'] =
          this.issuesContent.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IssuesContent {
  String url;
  String repositoryUrl;
  String labelsUrl;
  String commentsUrl;
  String eventsUrl;
  String htmlUrl;
  int id;
  String nodeId;
  int number;
  String title;
  User user;
  List<String> labels;
  String state;
  bool locked;
  List<String> assignees;
  int comments;
  String createdAt;
  String updatedAt;
  String authorAssociation;
  String body;

  IssuesContent(
      {this.url,
      this.repositoryUrl,
      this.labelsUrl,
      this.commentsUrl,
      this.eventsUrl,
      this.htmlUrl,
      this.id,
      this.nodeId,
      this.number,
      this.title,
      this.user,
      this.labels,
      this.state,
      this.locked,
      this.assignees,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.authorAssociation,
      this.body});

  IssuesContent.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    repositoryUrl = json['repository_url'];
    labelsUrl = json['labels_url'];
    commentsUrl = json['comments_url'];
    eventsUrl = json['events_url'];
    htmlUrl = json['html_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    title = json['title'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    labels = json['labels'].cast<String>();
    state = json['state'];
    locked = json['locked'];
    assignees = json['assignees'].cast<String>();
    comments = json['comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authorAssociation = json['author_association'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['repository_url'] = this.repositoryUrl;
    data['labels_url'] = this.labelsUrl;
    data['comments_url'] = this.commentsUrl;
    data['events_url'] = this.eventsUrl;
    data['html_url'] = this.htmlUrl;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['number'] = this.number;
    data['title'] = this.title;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['labels'] = this.labels;
    data['state'] = this.state;
    data['locked'] = this.locked;
    data['assignees'] = this.assignees;
    data['comments'] = this.comments;
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





// [
// {
// "url": "https://api.github.com/repos/efoxTeam/flutter-ui/issues/53",
// "repository_url": "https://api.github.com/repos/efoxTeam/flutter-ui",
// "labels_url": "https://api.github.com/repos/efoxTeam/flutter-ui/issues/53/labels{/name}",
// "comments_url": "https://api.github.com/repos/efoxTeam/flutter-ui/issues/53/comments",
// "events_url": "https://api.github.com/repos/efoxTeam/flutter-ui/issues/53/events",
// "html_url": "https://github.com/efoxTeam/flutter-ui/issues/53",
// "id": 454062553,
// "node_id": "MDU6SXNzdWU0NTQwNjI1NTM=",
// "number": 53,
// "title": "test issue",
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
// "labels": [""],
// "state": "open",
// "locked": false,
// "assignee": null,
// "assignees": [""],
// "milestone": null,
// "comments": 1,
// "created_at": "2019-06-10T08:47:37Z",
// "updated_at": "2019-06-10T08:51:54Z",
// "closed_at": null,
// "author_association": "NONE",
// "body": "api test"
// }
// ]