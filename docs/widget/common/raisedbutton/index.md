## **RaisedButton**
>
RaisedButton 凸起按钮

### 构造方法
``` dart
RaisedButton({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    double elevation,
    double highlightElevation,
    double disabledElevation,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior = Clip.none,
    MaterialTapTargetSize materialTapTargetSize,
    Duration animationDuration,
    Widget child,
  })
```

### 属性介绍
* onPressed: 点击回调
* textColor：文本颜色
* disabledTextColor：禁用文本颜色
* color：按钮颜色
* disabledColor: 禁用按钮颜色
* highlightColor：长按按钮颜色
* splashColor： 点击按钮水波纹颜色
* elevation： 按钮下面阴影
* highlightElevation：阴影大小
* disabledElevation：禁止阴影
* padding：按钮填充区域
* shape：按钮形状
* child：按钮中的Widget

### 高级用法
按钮形状
* BeveledRectangleBorder 带斜角的长方形边框
* CircleBorder 圆形边框
* RoundedRectangleBorder 圆角矩形
* StadiumBorder 两端是半圆的边框

设置按钮形状常用属性
* side：用来设置边线（颜色、宽度等）
* borderRadius：用来设置圆角

使用RaisedButton.icon可以创建图标（icon）和标签（label）的widget文本按钮