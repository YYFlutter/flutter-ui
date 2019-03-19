import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _index = 0;
  bool _scrollDirection = true;
  bool _pageSnapping = true;

  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  String getScrollDirectionText () {
    return _scrollDirection ? '左右' : '上下';
  }

  Axis getScrollDirection () {
    return _scrollDirection ? Axis.horizontal : Axis.vertical;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
      ),
      body: PageView(
        pageSnapping: _pageSnapping, // 与滚动行为相关
        reverse: false, // 滚动反方向 
        scrollDirection: getScrollDirection(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        children: [
          Center(
            child: Column(
              children: [
                Text('页面一'),
                Text('${getScrollDirectionText()}滑动切换页面哦~~~'),
                RaisedButton(
                  child: Text('当前为${getScrollDirectionText()}滑动，可点击切换'),
                  onPressed: () {
                    setState(() {
                      _scrollDirection = !_scrollDirection;
                    });
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('页面二'),
                Text('${getScrollDirectionText()}滑动切换页面哦~~~'),
                RaisedButton(
                  child: Text('当前为属性值pageSnapping为${_pageSnapping}，${_pageSnapping ? '滚动时，默认被捕获' : '由用户自行滚动'}，可点击切换'),
                  onPressed: () {
                    setState(() {
                      _pageSnapping = !_pageSnapping;
                    });
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('页面三'),
                Text('${getScrollDirectionText()}滑动切换页面哦~~~'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            _index = index;
          });
          _pageController.jumpToPage(index);
        },
        fixedColor: Colors.red,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            title: Text(
              '导航一',
              style: TextStyle(color: Colors.red),
            ),
            icon: Icon(
              Icons.navigate_before,
              color: Colors.redAccent,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              '导航二',
              style: TextStyle(color: Colors.red),
            ),
            icon: Icon(
              Icons.notifications_active,
              color: Colors.redAccent,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              '导航三',
              style: TextStyle(color: Colors.red),
            ),
            icon: Icon(
              Icons.navigate_next,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
