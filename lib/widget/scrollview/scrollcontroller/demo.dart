import 'package:flutter/material.dart';
import 'package:efox_flutter/config/theme.dart' show AppTheme;

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  ScrollController _controller = new ScrollController(
    initialScrollOffset: 99,
    keepScrollOffset: true,
  );
  bool toTopBtn = false;
  int count = 50;
  double height = 50;

  @override
  void initState() {
    super.initState();
    _controller.addListener(this.scrollEvent);
  }

  void scrollEvent() {
    print(_controller);
    var _status = false;
    if (_controller.offset > 100) {
      _status = true;
    } else {
      _status = false;
    }
    setState(() {
      this.toTopBtn = _status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollController'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 100,
          // ),
          controller: _controller,
          itemCount: this.count,
          itemExtent: this.height, // 行高
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(' $index 向上滚动，会显示回到顶部图标'),
            );
          },
        ),
      ),
      floatingActionButton: !this.toTopBtn
          ? null
          : FloatingActionButton(
              backgroundColor: Color(AppTheme.mainColor),
              child: Icon(
                Icons.arrow_upward,
                color: Color(AppTheme.secondColor),
              ),
              onPressed: () {
                _controller.jumpTo(-50);
              },
            ),
    );
  }
}
