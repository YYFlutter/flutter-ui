## **Switch**

>
Switch是切换按钮控件，通常用于设置的选项里

### 构造方法
``` dart
Switch({
  Key key,
  @required this.value,
  @required this.onChanged,
  this.activeColor,
  this.activeTrackColor,
  this.inactiveThumbColor,
  this.inactiveTrackColor,
  this.activeThumbImage,
  this.inactiveThumbImage,
  this.materialTapTargetSize,
  this.dragStartBehavior = DragStartBehavior.start,
})
```

### 属性介绍
* value: true：开 false：关
* onChanged: 变化时回调
* activeColor: 打开状态下颜色
* activeTrackColor: 打开状态下track颜色
* inactiveThumbColor: 关闭状态thumb颜色
* inactiveTrackColor: 关闭状态track颜色
* activeThumbImage: 打开状态下thumb图片
* inactiveThumbImage: 关闭状态thumb图片
* materialTapTargetSize: 配置点击目标的最小尺寸
* dragStartBehavior: 确定处理拖动开始行为的方式