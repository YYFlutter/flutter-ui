## **Scallold**
>
页面的基础布局结构控件，

### 构造方法
``` dart
Scaffold({
Key key,
PreferredSizeWidget appBar,
Widget body,
Widget floatingActionButton,
FloatingActionButtonLocation floatingActionButtonLocation,
FloatingActionButtonAnimator floatingActionButtonAnimator,
List<Widget> persistentFooterButtons,
Widget drawer,
Widget endDrawer,
Widget bottomNavigationBar,
Widget bottomSheet,
Color backgroundColor,
bool resizeToAvoidBottomPadding,
bool resizeToAvoidBottomInset,
bool primary: true,
DragStartBehavior drawerDragStartBehavior: DragStartBehavior.down })
```

### 属性介绍
* appBar: 头部导航条
* backgroundColor: 页面背景颜色
* body : 整个scaffold主要显示模块内容
* bottomNavigationBar：页面地方导航条
* bottomSheet: 持久可见的底部sheet,即使用户在和其他页面部分有交互，底部sheet依然是可见的。
可以使用showBottomSheet函数创建和显示模态底部sheet。如果用ShowBottomSheet这个函数
创建了bottomSheet，那么在build一个含有bottomSheet的新的Scaffold的时候，当前的bottomSheet必须关闭。bottomSheet可以是任何形式的widget
* drawer :页面的抽屉，有从左向右或者从右向左的显示效果