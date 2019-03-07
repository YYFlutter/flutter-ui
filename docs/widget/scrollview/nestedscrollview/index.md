## **NestedScrollView**
> 该滚动组件内部可嵌套滚动组件， 通常SliverAppBar+TabBar作为头部headerSliverBuilder，TabBarView作为主体body结合使用。

### 构造函数
```
NestedScrollView({
  Key key,
  this.controller,
  this.scrollDirection = Axis.vertical,
  this.reverse = false,
  this.physics,
  @required this.headerSliverBuilder,
  @required this.body,
  this.dragStartBehavior = DragStartBehavior.down,
}) 
```

### 属性介绍
- headerSliverBuilder: 控制appbar相关内容,接收数组组件。return [SliverOverlapAbsorber()]
- body: 组件滚动部分

### 相关属性
> SliverOverlapAbsorber 构造函数
```
  SliverOverlapAbsorber({
    Key key,
    @required this.handle,
    Widget child,
  })
```

> SliverOverlapInjector 构造函数
```
  SliverOverlapInjector({
    Key key,
    @required this.handle,
    Widget child,
  })
```
- SliverOverlapAbsorber: 该组件将一些带有重叠行为的组件，把重叠部分通过SliverOverlapInjector进行占位，使得整个页面衔接。（相关重叠可以参考CustomScrollView）
- SliverOverlapInjector： 与SliverOverlapAbsorber对应，填充交叠部分。
- handle: SliverOverlapAbsorberHandle, 通过NestedScrollView.sliverOverlapAbsorberHandleFor(context)回调，返回父级NestedScrollView，
- 更多查看代码注释