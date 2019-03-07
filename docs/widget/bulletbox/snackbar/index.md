## **SnackBar**

>
SnackBar 底部快捷提示，类似Toast，会自动隐藏
* 我们并不能直接显示SnackBar，我们可以借助于Scaffold.of(context).showSnackBar()来显示一个SnackBar
* 值得注意的是这个context必须不能是Scaffold节点下的context,因为Scaffold.of()方法需要从Widget树中去找到Scaffold的Context，所以如果直接在Scaffold中使用showSnackBar，需要在外层包括上Builder Widget，这个Builder不做任何的其他操作，只不过把Widget树往下移了一层而已

### 构造方法
``` dart
SnackBar({
  Key key,
  @required this.content,
  this.backgroundColor,
  this.action,
  this.duration = _kSnackBarDisplayDuration,
  this.animation,
})
```

### 属性介绍
* content: SnackBar要显示的内容
* backgroundColor: SnackBar背景颜色
* action: 用户可以执行的操作
* duration: 显示SnackBar的时间
* animation: SnackBar的显示与隐藏动画