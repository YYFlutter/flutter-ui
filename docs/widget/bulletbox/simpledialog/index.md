## **SimpleDialog**

>
SimpleDialog用于向用户传递确定信息并提供多个选项之间的选择的弹出层
* 对于通知用户情况的弹出框，请考虑使用AlertDialog

### 构造方法
``` dart
SimpleDialog({
  Key key,
  this.title,
  this.titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
  this.children,
  this.contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
  this.semanticLabel,
  this.shape,
})
```

### 属性介绍
* title: 对话框的标题（可选）
* titlePadding: 标题的周围填充
* children: 对话框的内容Widget
* contentPadding: 内容的周围填充
* semanticLabel: 可访问性框架用于在打开和关闭对话框时通知屏幕转换的对话框的语义标签
* shape: 对话框边框的形状