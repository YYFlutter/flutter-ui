//import 'dart:convert';

class UserInfo extends Object {
  String login;
  num id;
  String node_id;
  String avatar_url;
  String gravatar_id;
  String url;
  String html_url;
  String followers_url;
  String following_url;
  String gists_url;
  String starred_url;
  String subscriptions_url;
  String organizations_url;
  String repos_url;
  String events_url;
  String received_events_url;
  String type;
  bool site_admin;
  String name;
  String company;
  String blog;
  dynamic location;
  String email;
  dynamic hireable;
  dynamic bio;
  num public_repos;
  num public_gists;
  num followers;
  num following;
  String created_at;
  String updated_at;
  num private_gists;
  num total_private_repos;
  num owned_private_repos;
  num disk_usage;
  num collaborators;
  bool two_factor_authentication;
  Plan plan;

  UserInfo({
    this.login,
    this.id,
    this.node_id,
    this.avatar_url,
    this.gravatar_id,
    this.url,
    this.html_url,
    this.followers_url,
    this.following_url,
    this.gists_url,
    this.starred_url,
    this.subscriptions_url,
    this.organizations_url,
    this.repos_url,
    this.events_url,
    this.received_events_url,
    this.type,
    this.site_admin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.public_repos,
    this.public_gists,
    this.followers,
    this.following,
    this.created_at,
    this.updated_at,
    this.private_gists,
    this.total_private_repos,
    this.owned_private_repos,
    this.disk_usage,
    this.collaborators,
    this.two_factor_authentication,
    this.plan,
  });

  UserInfo.fromJson(instance) {
    login = instance['login'];
    id = instance['id'];
    node_id = instance['node_id'];
    avatar_url = instance['avatar_url'];
    gravatar_id = instance['gravatar_id'];
    url = instance['url'];
    html_url = instance['html_url'];
    followers_url = instance['followers_url'];
    following_url = instance['following_url'];
    gists_url = instance['gists_url'];
    starred_url = instance['starred_url'];
    subscriptions_url = instance['subscriptions_url'];
    organizations_url = instance['organizations_url'];
    repos_url = instance['repos_url'];
    events_url = instance['events_url'];
    received_events_url = instance['received_events_url'];
    type = instance['type'];
    site_admin = instance['site_admin'];
    name = instance['name'];
    company = instance['company'];
    blog = instance['blog'];
    location = instance['location'];
    email = instance['email'];
    hireable = instance['hireable'];
    bio = instance['bio'];
    public_repos = instance['public_repos'];
    public_gists = instance['public_gists'];
    followers = instance['followers'];
    following = instance['following'];
    created_at = instance['created_at'];
    updated_at = instance['updated_at'];
    private_gists = instance['private_gists'];
    total_private_repos = instance['total_private_repos'];
    owned_private_repos = instance['owned_private_repos'];
    disk_usage = instance['disk_usage'];
    collaborators = instance['collaborators'];
    two_factor_authentication = instance['two_factor_authentication'];
    plan = Plan.fromJson(instance['plan']);
  }

  Map<String, dynamic> toJson() => {
        'login': login,
        'id': id,
        'node_id': node_id,
        'avatar_url': avatar_url,
        'gravatar_id': gravatar_id,
        'url': url,
        'html_url': html_url,
        'followers_url': followers_url,
        'following_url': following_url,
        'gists_url': gists_url,
        'starred_url': starred_url,
        'subscriptions_url': subscriptions_url,
        'organizations_url': organizations_url,
        'repos_url': repos_url,
        'events_url': events_url,
        'received_events_url': received_events_url,
        'type': type,
        'site_admin': site_admin,
        'name': name,
        'company': company,
        'blog': blog,
        'location': location,
        'email': email,
        'hireable': hireable,
        'bio': bio,
        'public_repos': public_repos,
        'public_gists': public_gists,
        'followers': followers,
        'following': following,
        'created_at': created_at,
        'updated_at': updated_at,
        'private_gists': private_gists,
        'total_private_repos': total_private_repos,
        'owned_private_repos': owned_private_repos,
        'disk_usage': disk_usage,
        'collaborators': collaborators,
        'two_factor_authentication': two_factor_authentication,
        'plan': plan,
      };
}

class Plan extends Object {
  String name;
  num space;
  num collaborators;
  num private_repos;

  Plan({
    this.name,
    this.space,
    this.collaborators,
    this.private_repos,
  });

  Plan.fromJson(instance) {
    if (instance != null) {
      name = instance['name'];
      space = instance['space'];
      collaborators = instance['collaborators'];
      private_repos = instance['private_repos'];
    }
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'space': space,
        'collaborators': collaborators,
        'private_repos': private_repos,
      };
}
