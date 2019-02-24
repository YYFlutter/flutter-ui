## **Row**

>
Row是一个将其child显示在水平方向的widget

### 构造方法
```
Row({
  Key key,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  TextDirection textDirection,
  VerticalDirection verticalDirection = VerticalDirection.down,
  TextBaseline textBaseline,
  List<Widget> children = const <Widget>[],
})
```

### 属性介绍
> mainAxisAlignment 如何将child沿主轴放置在布局中
* start: 将child放置在主轴的最左侧
* center: 将child放置在主轴的中间
* end: 将child放置在主轴的最右侧
* spaceAround: 将自由空间放置在孩子之间，第一个和最后一个child与边界的距离是其他孩子之间的一半
* spaceBetween: 将自由空间放置在孩子之间，第一个和最后一个child与边界之间没有空间
* spaceEvenly: 将自由空间均匀的放置在children之间
> crossAxisAlignment 如何将child沿侧轴放置在布局中
* start: 将child放置在侧轴起点
* center: 将child放置在侧轴的中心
* end: 将child放置在侧轴的末端
* stretch: 将child填充侧轴
* baseline: 将child放置在侧轴上，使他们的基线匹配
> mainAxisSize: 主轴应占用多少空间
* max: 最大化沿主轴的可用空间量，默认值
* min: 最小化沿主轴的可用空间量

### 高级用法
> 在Row的children中使用Extanded包裹会使child沾满这个Row的宽度，使用flex可以设置对应的child占用的空间是其他child的倍数,默认flex:1