## **IconButton**
>
图标按钮，通过填充颜色（墨水）对触摸做出反应

### 构造方法
``` dart
IconButton({
    Key key,
    this.iconSize = 24.0,
    this.padding = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
    @required this.icon,
    this.color,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    @required this.onPressed,
    this.tooltip
  })
```

### 属性介绍
* iconSize = 24.0：图标大小
* padding = const EdgeInsets.all(8.0)：按钮图标周围的填充
* alignment = Alignment.center：图标对齐方式
* icon：图标
* color：图标颜色
* highlightColor：按钮处于按下时按钮的辅助颜色
* splashColor：按钮处于按下状态时按钮颜色
* disabledColor：图标被禁用时按钮内图标的颜色
* onPressed：点击回调
* tooltip：长按文本提示