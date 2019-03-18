## **BottomNavigationBar**
> Scaffold的属性，增加底部导航栏tab

### 构造函数
```
BottomNavigationBar({
  Key key,
  @required this.items,
  this.onTap,
  this.currentIndex = 0,
  BottomNavigationBarType type,
  this.fixedColor,
  this.iconSize = 24.0,
})
```

### 属性介绍
- items: 数组类型，tab，通过BottomNavigationBarItem实现
- onTap: 点击后回调函数，返回点击的数组下标，从0开始
- currentIndex：当前激活的下标值
- type: BottomNavigationBarType类型，默认fixed（固定位置大小，点击无动画效果），还有shifting（点击时有动画效果）
  > fixed: 固定大小，无动画效果。
  > shifting: 带有动画效果，只有激活的标签带有主题颜色，可自行增加默认颜色
- fixedColor: 图标与字体颜色，当type的值为BottomNavigationBarType.shifting时，级别比较低。
- iconSize：double类型，图标大小。

### 高级用法
- 可以定义一个变量，通过setState方法改变currentIndex的值。Scaffold中的body属性可以使用PageView，实现body页面切换带动导航栏切换，可导航栏触发body页面切换。
- BottomNavigationBarItem：属性items中的组件
  ```
    BottomNavigationBarItem({
      @required this.icon,
      this.title,
      Widget activeIcon,
      this.backgroundColor,
    }) 
  ```
  > title: 定义标题
  > icon: 图标
  > activeIcon: 选中时图标