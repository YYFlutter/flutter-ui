## **FlatButton**

>
文本标签按钮
* onPressed回调为null,则该按钮将被禁用

### 构造方法
``` dart
FlatButton({
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
  EdgeInsetsGeometry padding,
  ShapeBorder shape,
  Clip clipBehavior = Clip.none,
  MaterialTapTargetSize materialTapTargetSize,
  @required Widget child,
})
```

### 属性介绍
* onPressed: 点击回调
* textColor：文本颜色
* disabledTextColor：禁用文本颜色
* color：按钮颜色
* disabledColor: 禁用按钮颜色
* highlightColor：长按按钮颜色
* child：按钮中的Widget