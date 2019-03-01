## **Flow**

>
实现优化流式布局以使用流布局的控件
* 实现较为复杂，一般可通过Wrap来替换实现

### 构造方法
``` dart
Flow({
  Key key,
  @required this.delegate,
  List<Widget> children = const <Widget>[],
})
```

### 属性介绍
* delegeate: 影响布局的FlowDelegate，包含方法如下：
  * paintChildren: child的绘制控制代码，可以调整尺寸位置
  * shouldPepaint：是否需要重绘
  * shouldRelayout：是否需要重新布局
  * getConstraintsForChild：设置每个child的约束条件，会覆盖已有
  * getSize： 设置Flow的尺寸
* children: Flow中的内容widget