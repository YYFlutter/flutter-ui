## **GestureDetector**
> 该组件可监听触摸事件，可包裹需要监听的组件后使用带有的触摸事件。

### 构造函数
```
GestureDetector({
  Key key,
  this.child,
  this.onTapDown,
  this.onTapUp,
  this.onTap,
  this.onTapCancel,
  this.onDoubleTap,
  this.onLongPress,
  this.onLongPressUp,
  this.onLongPressDragStart,
  this.onLongPressDragUpdate,
  this.onLongPressDragUp,
  this.onVerticalDragDown,
  this.onVerticalDragStart,
  this.onVerticalDragUpdate,
  this.onVerticalDragEnd,
  this.onVerticalDragCancel,
  this.onHorizontalDragDown,
  this.onHorizontalDragStart,
  this.onHorizontalDragUpdate,
  this.onHorizontalDragEnd,
  this.onHorizontalDragCancel,
  this.onForcePressStart,
  this.onForcePressPeak,
  this.onForcePressUpdate,
  this.onForcePressEnd,
  this.onPanDown,
  this.onPanStart,
  this.onPanUpdate,
  this.onPanEnd,
  this.onPanCancel,
  this.onScaleStart,
  this.onScaleUpdate,
  this.onScaleEnd,
  this.behavior,
  this.excludeFromSemantics = false,
  this.dragStartBehavior = DragStartBehavior.down,
})
```

### 属性介绍
> 点击事件可用Tap属性,执行顺序如下罗列
- onTapDown: 触摸时触发
- onTapUp: 触摸离开时触发
- onTap: 点击后触发
- onTapCancel: 触发时取消
- onDoubleTap: 200毫秒内触摸时触发，但不触发onTap
> 拖动事件可用Pan属性,执行顺序如下罗列,拖动时返回是手势位移数据
- onPanDown: 
- onPanStart: (DragStartDetails e) {} 返回相对屏幕位置
- onPanUpdate: (DragUpdateDetails e) {} 回调函数中返回是手势位移数据
- onPanEnd: (DragEndDetails e) {} 回调函数中返回Velocity，手势瞬时速度，可结合动画使用
- onPanCancel: 回调取消
> 以下也可执行拖动事件，使用后不会触发Tap/Pan事件,执行顺序如下罗列，拖动时返回相对整个屏幕距离数据
- onForcePressStart: (ForcePressDetails e) {}
- onForcePressPeak: (ForcePressDetails e) {}
- onForcePressUpdate: (ForcePressDetails e) {}
- onForcePressEnd: (ForcePressDetails e) {}
> 监听垂直或水平方向
- onVerticalDragDown
- onVerticalDragStart
- onVerticalDragUpdate
- onVerticalDragEnd
- onVerticalDragCancel
- onHorizontalDragDown
- onHorizontalDragStart
- onHorizontalDragUpdate
- onHorizontalDragEnd
- onHorizontalDragCancel
> 手势放大
- onScaleStart
- onScaleUpdate
- onScaleEnd

