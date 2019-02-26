## **Align**
>
对齐控件，能将子控件向所指定的方向对齐，并根据子级的大小自行调整自己的大小

### 构造方法
``` dart
Align({
  Key key,
  this.alignment = Alignment.center,
  this.widthFactor,
  this.heightFactor,
  Widget child
})
```

### 属性介绍
* alignment: 对齐方式，一般会使用系统默认提供的9种方式， Alignment.topLeft/topCenter/topRight/centerLeft/center/centerRight/bottomLeft/bottomCenter/bottomRight,也可以通过设置Alignment(数值，数值)来对齐,数值范围-1.0-1.0
* widthFactor/heightFactor: 当widthFactor和heightFactor为null的时候，Align会调整到child的尺寸,当widthFactor或者heightFactor不为null的时候，Aligin会根据factor属性，扩展自己的尺寸，例如设置widthFactor为2.0的时候，那么，Align的宽度将会是child的两倍
* child: Align中的内容widget