## **SwitchListTile**

>
带有标签的开关

### 构造方法
``` dart
SwitchListTile({
  Key key,
  @required this.value,
  @required this.onChanged,
  this.activeColor,
  this.activeTrackColor,
  this.inactiveThumbColor,
  this.inactiveTrackColor,
  this.activeThumbImage,
  this.inactiveThumbImage,
  this.title,
  this.subtitle,
  this.isThreeLine = false,
  this.dense,
  this.secondary,
  this.selected = false,
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
* title: 标题
* subtitle: 子标题
* isThreeLine: 是否显示三行文本
* dense: 是否垂直密集显示
* secondary: 显示左侧侧的小组件
* selected: 是否使用activeColor渲染图标和文本
