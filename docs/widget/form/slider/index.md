## **Slider**

>
Silder用来选择连续性的或者非连续性的数据

### 构造方法
``` dart
Slider({
  Key key,
  @required this.value,
  @required this.onChanged,
  this.onChangeStart,
  this.onChangeEnd,
  this.min = 0.0,
  this.max = 1.0,
  this.divisions,
  this.label,
  this.activeColor,
  this.inactiveColor,
  this.semanticFormatterCallback,
})
```

### 属性介绍
* value：Silder当前值
* onChanged：滑块状态发生变化时进行回调
* onChangeStart：滑块状态刚发生变化时的回调
* onChangeEnd：滑块状态变化结束时的回调
* min：用户可以选择的最小值
* max：用户可以选择的最大值
* divisions：将silder划分为几份
* label：滑块处于活动状态时显示在滑块上方的标签
* activeColor：用于滑块轨道中活动部分的颜色
* inactiveColor：滑块轨道的非活动部分的颜色

