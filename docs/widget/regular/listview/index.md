## **ListView**

>
滚动列表控件
* 与GridView相似，基本上市slivers里面只包含一个SliverList的CustomScrollView
* 在Flutter中有几种构建ListView的方式，分别为：默认 **List, ListView.builder, ListView.separated, ListView.custom**

### 构造方法
``` dart
ListView({
  Key key,
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  bool shrinkWrap = false,
  EdgeInsetsGeometry padding,
  this.itemExtent,
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  bool addSemanticIndexes = true,
  double cacheExtent,
  List<Widget> children = const <Widget>[],
  int semanticChildCount,
})
```

### 属性介绍
* scrollDirection: 滚动方向，值为Axis.vertical/horizontal, 默认为垂直方向（Axis.vertical）
* reverse：默认是从上到下或者从左到右滚动的，这个属性控制是否反向，默认值为false，不反向滚动
* controller: 控制child滚动时候的位置
* physics: ScrollPhysics类，影响视图与用户输入交互
* padding: 边距区域
* shrinkWrap： 默认false, 滚动视图内容展开和收缩时不重新计算视图大小
* itemExtent： ListView在滚动方向上每个item所占的高度值
* children：ListView中的内容Widget

> ListView默认方式
* 默认List方式，是把数据添加到列表中，之后直接添加到ListView即可,适用于只有少量子项

> ListView.builder()
* 适用于具有大量（或无限）子项数的列表视图
* 设置单个item的属性，懒加载，假如有1000个列表，初始渲染时不会对所有都进行渲染，而只会对特定数量的item进行渲染，这对于性能和用户体验来说是很好的提升
> ListView.separated()
* separated相对于builder多了一个separatorBuilder参数，它的作用是返回一个分割线，用于控制列表各个元素的间隔如何渲染
> ListView.custom()
* 必须参数是childrenDelegate，然后传入一个实现了SliverChildDelegate的组件，如SliverChildListDelegate或者SliverChildBuilderDelegate