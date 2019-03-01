## **GridView**

> 
Scrollable是一个可滚动的组件，ListView、GridView都会间接使用到该组件。

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