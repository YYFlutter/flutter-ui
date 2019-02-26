## **Center**

>
将child置于中心的控件
* Center继承自Align，只不过是将alignment设置为Alignment.center

### 构造方法
``` dart
Center({
  Key key,
  double widthFactor,
  double heightFactor,
  Widget child
})
```

### 属性介绍
* widthFactor/heightFactor: 当widthFactor和heightFactor为null的时候，Center会调整到child的尺寸,当widthFactor或者heightFactor不为null的时候，Center会根据factor属性，扩展自己的尺寸，例如设置heightFactor为2.0的时候，那么，Center的高度将会是child的两倍
* child: Center中的内容widget