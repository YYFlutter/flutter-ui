## **RadioListTile**

>
带标签的单选按钮

### 构造方法
``` dart
RadioListTile({
    Key key,
    @required this.value,
    @required this.groupValue,
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
* value：单选按钮的值
* groupValue：此组单选按钮的当前选定值，当value=groupValue时表示该按钮被选中
* onChanged：选择单选按钮时的回调
* activeColor：选中该按钮的颜色
* title: 标题
* subtitle: 子标题
* isThreeLine: 是否显示三行文本
* dense: 是否垂直密集显示
* secondary: 显示单选按钮一侧的小组件
* selected: 是否使用activeColor渲染图标和文本
* controlAffinity: 相对于文本放置控件位置