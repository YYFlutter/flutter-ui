## **ListBody**

>
该控件沿着给定的轴顺序排列子节点
* ListBody是一个不常直接使用的控件，一般会配合ListView或者Column等控件使用
* 在主轴上，子节点按照顺序进行布局，在交叉轴上，子节点尺寸会被拉伸，以适应交叉轴的区域
* 在主轴上，给予子节点的空间必须是不受限制的（unlimited），使得子节点可以全部被容纳,ListBody不会去裁剪或者缩放其子节点

### 构造方法
``` dart
ListBody({
  Key key,
  this.mainAxis = Axis.vertical,
  this.reverse = false,
  List<Widget> children = const <Widget>[],
})
```

### 属性介绍
* mainAxis：排列的主轴方向，Axis.vertical/horizontal
* reverse：是否反向
* children：ListBody中的内容Widget