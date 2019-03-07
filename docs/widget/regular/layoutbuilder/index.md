## **LayoutBuilder**

>
构建可依赖于父控件大小的控件树

### 构造方法
``` dart
 const LayoutBuilder({
  Key key,
  @required this.builder
})
```

### 属性介绍
* builder: 传入一个LayoutWidgetBuilder类，builder: (BuildContext context, BoxConstraints viewportConstraints)
  * 通过viewportConstraints可以获取到父控件的尺寸
  * builder: 在布局时调用来构造小部件树,该构建器不得返回nul