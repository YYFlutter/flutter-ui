## **Text**

>
单一样式的文本,文本可多行显示，也可能全部显示在同一行上
* 默认会继承最接近控件的DefaultTextStyle
* 最基本的文本组件

### 构造方法

``` dart
Text(this.data, {
  Key key,
  this.style,
  this.textAlign,
  this.textDirection,
  this.locale,
  this.softWrap,
  this.overflow,
  this.textScaleFactor,
  this.maxLines,
  this.semanticsLabel,
})
```

### 属性介绍
* data: Text显示的文本，必选参数
* style: 文本样式
* textAlign: 文本对齐方式
* textDirection: 文本显示方向
* maxLines: 文本最多显示几行
* overflow: 文本溢出显示的截断方式
* textScaleFactor: 文本缩放比例
