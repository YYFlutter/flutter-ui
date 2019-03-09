## **CheckboxListTile**

>
带有标签的复选框

### 构造方法
``` dart
CheckboxListTile({
  Key key,
  @required this.value,
  @required this.onChanged,
  this.activeColor,
  this.title,
  this.subtitle,
  this.isThreeLine = false,
  this.dense,
  this.secondary,
  this.selected = false,
  this.controlAffinity = ListTileControlAffinity.platform,
})
```

### 属性介绍
* value: 复选框选择状态
* onChanged: 点击复选框的回调函数
* activeColor: 选中此复选框时要使用的颜色
* title: 标题
* subtitle: 子标题
* isThreeLine: 是否显示三行文本
* dense: 是否垂直密集显示
* secondary: 显示复选框一侧的小组件
* selected: 是否使用activeColor渲染图标和文本
* controlAffinity: 相对于文本放置控件位置