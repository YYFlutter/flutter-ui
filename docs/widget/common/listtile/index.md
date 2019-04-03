## **ListTile**
>
单个固定高度的行，通常包含一些文本和前导或者尾随的图标，通常在ListView中使用

### 构造方法
``` dart
ListTile({
    Key key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
  })
```

### 属性介绍

* leading：显示左侧的小组件
* title：标题
* subtitle：子标题
* trailing：显示右侧的小组件
* isThreeLine = false：是否显示三行文本
* dense：是否垂直密集显示
* contentPadding：ListTile的内部填充
* enabled = true：是否是交互式的
* onTap：点击时的回调
* onLongPress：长按时的回调
* selected = false：图标和文本是否以相同颜色呈现
