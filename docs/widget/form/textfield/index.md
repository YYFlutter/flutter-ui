## **TextField**

>
TextField最常用的文本输入Widget


### 构造方法
``` dart
TextField({
  Key key,
  this.controller,
  this.focusNode,
  this.decoration = const InputDecoration(),
  TextInputType keyboardType,
  this.textInputAction,
  this.textCapitalization = TextCapitalization.none,
  this.style,
  this.strutStyle,
  this.textAlign = TextAlign.start,
  this.textDirection,
  this.autofocus = false,
  this.obscureText = false,
  this.autocorrect = true,
  this.maxLines = 1,
  this.maxLength,
  this.maxLengthEnforced = true,
  this.onChanged,
  this.onEditingComplete,
  this.onSubmitted,
  this.inputFormatters,
  this.enabled,
  this.cursorWidth = 2.0,
  this.cursorRadius,
  this.cursorColor,
  this.keyboardAppearance,
  this.scrollPadding = const EdgeInsets.all(20.0),
  this.dragStartBehavior = DragStartBehavior.start,
  this.enableInteractiveSelection,
  this.onTap,
  this.buildCounter,
})
```

### 属性介绍
* controller：TextField的控制器，可用来添加通知或者获取TextField的值，如controller.text
* decoration = const InputDecoration()：装饰器，设置相关的属性能构造出各种TextField效果，详情见Demo
* TextInputType keyboardType：TextField获得焦点时弹出的键盘类型
* style：输入框文本样式
* textAlign：文本对齐方式
* textDirection：文本方向
* autofocus：是否自动对焦
* obscureText：是否以密码形式显示
* autocorrect：是否自动更正
* maxLines：最大行数
* maxLength：最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
* maxLengthEnforced = true：
* onChanged：输入框内容改变进行回调
* onEditingComplete：输入完毕回调
* onSubmitted：内容提交，回车的回调
* enabled：是否禁用
* cursorWidth = 2.0：光标的宽度
* cursorRadius：光标的角的圆角
* cursorColor：光标的颜色
* onTap：点击文本时调用