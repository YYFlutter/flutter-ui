## **BottomSheet**

>
底部菜单，通常情况下分享操作界面使用比较多
* 显示BottomSheet我们可以通过调用：showBottomSheet或者showModalBottomSheet方法，showBottomSheet是从新打开了一个界面来显示，showModalBottomSheet是直接在当前界面的下面来显示
* 两个方法都需要传入一个context和WidgetBuilder

### 构造方法
``` dart
showModalBottomSheet<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
})
showBottomSheet<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
})
```

### 属性介绍
context：上下文
builder： 构造器