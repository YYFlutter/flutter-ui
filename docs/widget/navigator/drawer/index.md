## **Drawer**
> 抽屉式组件，从Scaffold边缘水平滑出左侧菜单，也可通过Scaffold.of(context).openDrawer()显示左侧菜单。关闭页面通过Navigator.pop(context)。

### 构造函数
```
Drawer({
  Key key,
  double elevation: 16.0,
  Widget child,
  String semanticLabel
})
```

### 属性介绍
- child: 菜单内容
- elevation：导航栏底部阴影

### 高级用法
- 关闭菜单
> Navigator.pop(context)
- 打开菜单
> 方法一： Scaffold.of(context).openDrawer()
```
使用context变量时，需要注意在scaffold中增加Builder来获取到context，该context才是scaffold中的上下文对象，而Build build(BuildContext context)是外层类的上下文，没法操作菜单
Builder(
  builder: (context) {
    return RaisedButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      child: Text("点击滑出左侧菜单"),
    );
  },
),
```

> 方法二： static GlobalKey<ScaffoldState> _globalKey= new GlobalKey();
```
定义globalKey

static GlobalKey<ScaffoldState> _globalKey= new GlobalKey();
...
Scaffold(
    key: _globalKey , //设置key
    ...  
)

通过globalkey操作菜单状态
_globalKey.currentState.openDrawer()
```
