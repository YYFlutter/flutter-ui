## **FloatingActionButton**
> 在Scaffold中属性floatingActionButton实现FloatingActionButton，该组件是个圆形的浮层按钮，一般情况下child可用icon进行绘画。

### 构造函数
```
FloatingActionButton({
  Key key,
  this.child,
  this.tooltip,
  this.foregroundColor,
  this.backgroundColor,
  this.heroTag = const _DefaultHeroTag(),
  this.elevation = 6.0,
  this.highlightElevation = 12.0,
  double disabledElevation,
  @required this.onPressed,
  this.mini = false,
  this.shape = const CircleBorder(),
  this.clipBehavior = Clip.none,
  this.materialTapTargetSize,
  this.isExtended = false,
})
```

### 属性介绍
- onPressed： 必填属性，函数调用，点击按钮后回调事件
- child: 组件子组件内容，可通过Icon简单的增加图标
- elevation：图标下阴影大小
- highlightElevation: 点击后阴影扩散范围
- tooltip：长按提示
- foregroundColor：前景色，如图标、文字的颜色
- backgroundColor：背景填充色
- mini: 默认false，true时为迷你按钮


