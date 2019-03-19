## **PageView**
> 创建一个整屏滚动的滚动列表，逐页滚动


### 构造函数
```
PageView({
  Key key,
  Axis scrollDirection: Axis.horizontal,
  bool reverse: false,
  PageController controller,
  ScrollPhysics physics,
  bool pageSnapping: true,
  ValueChanged<int> onPageChanged,
  List<Widget> children: const [],
  DragStartBehavior dragStartBehavior: DragStartBehavior.down
})
```

### 属性介绍
- children：页面列表，每个子元素对应一个当前页。
- scrollDirection: Axis.horizontal/Axis.vertical， 默认是水平方向，可选择垂直方向滚动
- reverse: 滚动方向取反操作
- controller: 操作页面滚动行为类，可以通过PageController实例后的对象进行指定页面跳转，可携带特效跳转等。PageController.jumpToPage(index)
- physics: 滚动属性，可参考滚动类别中的gridview等相近属性介绍
- pageSnapping: 默认true，切换时，自动逐页跳转。当自定义滚动行为时，可设置为false，禁止页面捕获。
- onPageChanged: 页面切换时，回调函数，返回页面下标值
