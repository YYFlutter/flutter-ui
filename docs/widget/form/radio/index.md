## **Radio**

>
单选按钮

### 构造方法
``` dart
Radio({
  Key key,
  @required this.value,
  @required this.groupValue,
  @required this.onChanged,
  this.activeColor,
  this.materialTapTargetSize,
}) 
```

### 属性介绍
* value：单选按钮的值
* groupValue：此组单选按钮的当前选定值，当value=groupValue时表示该按钮被选中
* onChanged：选择单选按钮时的回调
* activeColor：选中该按钮的颜色