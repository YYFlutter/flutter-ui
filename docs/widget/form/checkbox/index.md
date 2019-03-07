## **CheckBox**

>
复选框
* 复选框本身不保持任何状态
* 当复选框的状态发生变化时，窗口小部件会调用onChanged回调
* 大多数使用复选框的小部件将侦听onChanged回调并使用新值重建复选框以更新复选框的可视外观

### 构造方法
``` dart
Checkbox({
  Key key,
  @required this.value,
  this.tristate = false,
  @required this.onChanged,
  this.activeColor,
  this.materialTapTargetSize,
})
```

### 属性介绍
* value: 复选框的状态
* tristate: 当tristate为true，则复选框可以选择显示三个值 - true，false和null，当value为null时，将显示破折号。默认情况下， tristate为false，复选框的值必须为true或false
* onChanged: 点击复选框的回调函数
* activeColor: 选中此复选框时要使用的颜色
* materialTapTargetSize: 配置点击目标的最小尺寸
