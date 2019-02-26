## **FittedBox**
>
根据需要，对child进行缩放（Scale）以及位置调整（Position）
* 如果外部有约束的话，按照外部约束调整自身尺寸，然后缩放调整child，按照指定的条件进行布局
* 如果没有外部约束条件，则跟child尺寸一致，指定的缩放以及位置属性将不起作用。

### 构造方法
``` dart
FittedBox({
  Key key,
  this.fit = BoxFit.contain,
  this.alignment = Alignment.center,
  Widget child,
})
```

### 属性介绍
* fit: 缩放的方式，默认的属性是BoxFit.contain, 可参考Demo变化
* alignment: 对齐方式，默认的属性是Alignment.center，居中显示child, 可参考Demo变化
* child: FittedBox中的内容widget