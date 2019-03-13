## **AppBar**
> 创建导航栏，

### 构造函数
```
AppBar({
  Key key,
  Widget leading,
  bool automaticallyImplyLeading: true,
  Widget title,
  List<Widget> actions,
  Widget flexibleSpace,
  PreferredSizeWidget bottom,
  double elevation,
  Color backgroundColor,
  Brightness brightness,
  IconThemeData iconTheme,
  TextTheme textTheme,
  bool primary: true,
  bool centerTitle,
  double titleSpacing: NavigationToolbar.kMiddleSpacing,
  double toolbarOpacity: 1.0,
  double bottomOpacity: 1.0
})
```

### 属性介绍
- leading: 导航栏左侧图标
- title: 导航栏标题
- actions: 导航栏右侧扩展图标，可添加PopupMenuButton，点开有下拉展开更多按钮。
- automaticallyImplyLeading: 默认true, 当有上一级页面时，默认显示back按钮
- bottom: 通过与Tabbar使用