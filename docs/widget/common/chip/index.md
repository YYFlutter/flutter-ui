## **Chip**

>
一般用于显示标签的控件

### 构造方法
``` dart
Chip({
    Key key,
    this.avatar,
    @required this.label,
    this.labelStyle,
    this.labelPadding,
    this.deleteIcon,
    this.onDeleted,
    this.deleteIconColor,
    this.deleteButtonTooltipMessage,
    this.shape,
    this.clipBehavior = Clip.none,
    this.backgroundColor,
    this.padding,
    this.materialTapTargetSize,
    this.elevation,
  })
```

### 属性介绍

* avatar：标签左侧widget，一般为小图标
* label：标签内容
* labelStyle：标签样式
* labelPadding：标签周围填充
* deleteIcon：删除图标
* onDeleted：删除回调，为空时不显示删除图标
* deleteIconColor：删除图标颜色
* deleteButtonTooltipMessage：删除图标的tip提示文字
* shape：形状
* backgroundColor：背景颜色
* padding：标签内容和外形之间的填充
* materialTapTargetSize：配置点击目标的最小尺寸
* elevation：标签阴影

### 延生
* ActionChip
* FilterChip
* ChoiceChip
