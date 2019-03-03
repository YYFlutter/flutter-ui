## **CustomScrollView**

> 一个使用slivers创建自定义的滚动效果的ScrollView

### 构造方法
```
CustomScrollView({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    Key center,
    double anchor = 0.0,
    double cacheExtent,
    this.slivers = const <Widget>[],
    int semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
})
```

### 属性介绍
> viewportBuilder：显示滚动组件的属性，实例CustomScrollView/SingleChildScrollView实现不同的滚动效果。
- CustomScrollView: 实现随滚动条，appbar向上移动效果
- SingleChildScrollView：参考SingleChildScrollView

### CustomScrollView
> CustomScrollView：结合slivers使用,常用小组件为SliverAppBar, SliverGrid,SliverFixedExtentList
> SliverAppBar: 滚动标题头小组件
    ```dart
    SliverAppBar({
        Key key,
        this.leading,
        this.automaticallyImplyLeading = true,
        this.title,
        this.actions,
        this.flexibleSpace,
        this.bottom,
        this.elevation,
        this.forceElevated = false,
        this.backgroundColor,
        this.brightness,
        this.iconTheme,
        this.textTheme,
        this.primary = true,
        this.centerTitle,
        this.titleSpacing = NavigationToolbar.kMiddleSpacing,
        this.expandedHeight,
        this.floating = false,
        this.pinned = false,
        this.snap = false,
      })
    
    ```
- pinned: 默认为false, 非滚动至顶部时，标题头始终处于隐藏，当true时，标题头始终显示，但不会显示flexibleSpace内容 
- floating: 默认为false，当为true时，下拉会显示appbar，但不会自动展开flexibleSpace的内容
- snap: 默认为false，当floating为true, 当前才能为true，向下拉时，会自动显示flexibleSpace的内容