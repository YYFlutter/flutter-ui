## **LongPressDraggable**
> 长按能拖动的组件，属性中child和feedback不能为空

### 构造函数
```
LongPressDraggable<T>({
  Key key,
  @required Widget child,
  @required Widget feedback,
  T data,
  Axis axis,
  Widget childWhenDragging,
  Offset feedbackOffset: Offset.zero,
  DragAnchor dragAnchor: DragAnchor.child,
  int maxSimultaneousDrags,
  VoidCallback onDragStarted,
  DraggableCanceledCallback onDraggableCanceled,
  DragEndCallback onDragEnd,
  VoidCallback onDragCompleted,
  bool hapticFeedbackOnStart: true,
  bool ignoringFeedbackSemantics: true
})
```

### 属性介绍
- child: 拖动目标子组件，可配合DragTarget使用
- feedback: 拖动时跟随手势组件/提示内容
- feedbackOffset: 以手势为中心的偏移量，会影响命中的目标
- data: 定义下标，该值会在DragTarget中返回
- axis: Axis.horizontal/Axis.vertical, 默认不限制，赋值后按照限制水平拖动或垂直拖动
- childWhenDragging: 拖动时，可修改被拖动组件的内容。
- onDragStarted: () {}, 拖动开始时回调
- DragEndCallback: (detials) {}, 拖动结束时回调, 返回拖动相关属性
- onDragCompleted: () {}, 完成拖动时回调
- onDraggableCanceled: () {}， 拖动取消


