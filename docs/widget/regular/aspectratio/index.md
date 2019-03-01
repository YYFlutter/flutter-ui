## **AspectRatio**

>
将子控件调整为特定宽高比的控件
* AspectRatio 首先会尝试布局约束的最大宽度，widget的高度是通过给定的宽度和宽高比率来决定的
* 对于需要缩放调整位置的，一般是对图片的处理

### 构造方法
``` dart
AspectRatio({
  Key key,
  @required this.aspectRatio,
  Widget child
})
```

### 属性介绍
* aspectRatio: 宽高比，如1.5，宽度是高度的1.5倍
* child: AspectRatio中的内容widget