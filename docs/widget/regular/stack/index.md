## **Stack**

>
该Widget将子控件相对于其边框进行定位
* Stack的布局行为，根据child是positioned节点还是non-positioned节点来区分
  * 对于positioned的子节点，它们的位置会根据所设置的top、bottom、right以及left属性来确定，这几个值都是相对于Stack的左上角；
  * 对于non-positioned的子节点，它们会根据Stack的aligment来设置位置。
* 对应child的顺序，第一个child会被绘制在最低端

### 构造方法
``` dart
Stack({
  Key key,
  this.alignment = AlignmentDirectional.topStart,
  this.textDirection,
  this.fit = StackFit.loose,
  this.overflow = Overflow.clip,
  List<Widget> children = const <Widget>[],
})
```

### 属性介绍
* alignment： 对齐方式,默认是topLeft
* textDirection：文本方向，不常用
* fit: 默认loose
  * loose：子节点尺寸可以从min到max
  * expand：子节点尽可能占用空间
  * passthrough: 不改变子节点约束
* overflow：超过部分是否裁切，Overflow.clip/visible
* children: Stack中的内容Widget

