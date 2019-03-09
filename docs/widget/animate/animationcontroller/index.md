## **AnimationController**

>
AnimationController是一个特殊的Animation对象
* 默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字
* 创建一个AnimationController时需要传递一个vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源，通过将SingleTickerProviderStateMixin添加到类定义中
* 实例化一个AnimationController不会启动它运行，可以通过 .forward()方法启动动画
* AnimationController的addListener方法可以监听动画每一帧
* AnimationController的addStatusListener方法可以监听动画的状态


### 构造方法
``` dart
AnimationController({
  double value,
  this.duration,
  this.debugLabel,
  this.lowerBound = 0.0,
  this.upperBound = 1.0,
  this.animationBehavior = AnimationBehavior.normal,
  @required TickerProvider vsync,
})
```

### 属性介绍
* value: 动画值
* lowerBound: 动画最小值
* upperBound: 动画最大值
* duration: 动画持续时间
* vsync: vsync对象会绑定动画的定时器到一个可视的widget，所以当widget不显示时，动画定时器将会暂停，当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。 如果要使用自定义的State对象作为vsync时，请包含TickerProviderStateMixin，因为是当前Widget使用动画，所以一般绑定值为 this
