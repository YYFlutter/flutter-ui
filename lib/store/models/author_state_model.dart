import '../objects/author_info.dart' show AuthorInfo;

class AuthorModel {
  get state => {
        'ken': AuthorInfo(
          name: 'Ken',
          avatarUrl:
              'https://avatars0.githubusercontent.com/u/3890513?s=400&v=4',
          id: 'ken',
          url: 'https://github.com/ckken',
        ),
        'wanwu': AuthorInfo(
          name: 'wanwu',
          avatarUrl:
              'https://avatars3.githubusercontent.com/u/15372930?s=460&v=4',
          id: 'wanwu',
          url: 'https://github.com/wanwusangzhi',
        ),
        'lhr': AuthorInfo(
          name: 'Lin-Haoran',
          avatarUrl:
              'https://avatars3.githubusercontent.com/u/30428314?s=400&v=4',
          id: 'lhr',
          url: 'https://github.com/DIVINER-only',
        )
      };

  getAuthorInfo(key) {
    return this.state[key];
  }

  methods(name, payload) async {
    switch (name) {
      case 'getAuthorInfo':
        return getAuthorInfo(payload);
    }
  }
}
