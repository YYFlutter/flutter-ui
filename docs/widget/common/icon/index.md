## **Icon**

>
使用IconData中描述的小图标，flutter大概内置了1000+个icon
### 构造方法
``` dart
Icon(this.icon, {
  Key key,
  this.size,
  this.color,
  this.semanticLabel,
  this.textDirection,
})
```

### 属性介绍
* this.icon:  IconData对象，必须传入
* size：图标大小
* color：图标颜色
* semanticLabel：图标的语义标签
* textDirection：渲染图标的文本方向