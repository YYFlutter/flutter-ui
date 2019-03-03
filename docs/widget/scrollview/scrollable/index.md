## **Scrollable**

> 实现了可滚动widget的交互模型，但不包含UI显示相关的逻辑

### 构造方法
```
Scrollable({
  Key key,
  AxisDirection axisDirection: AxisDirection.down,
  ScrollController controller,
  ScrollPhysics physics,
  @required ViewportBuilder viewportBuilder,
  bool excludeFromSemantics: false,
  int semanticChildCount,
  DragStartBehavior dragStartBehavior: DragStartBehavior.down
})
```

### 属性介绍
> viewportBuilder：显示滚动组件的属性，实例CustomScrollView/SingleChildScrollView实现不同的滚动效果。
- CustomScrollView: 实现随滚动条，appbar向上移动效果，具体参考CustomScrollView
- SingleChildScrollView：具体参考SingleChildScrollView