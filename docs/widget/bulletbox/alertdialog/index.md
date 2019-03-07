## **AlertDialog**

>
AlertDialog向用户传递信息的弹出框，警报对话框
* 一般使用在通知用户需要确认的情况，具有可选标题和可选的操作列表
* 对于为用户提供多个选项之间选择的对话框，请考虑使用SimpleDialog
* 如果内容太大无法放入屏幕，请优先考虑使用SingleChildScrollView来避免内容溢出
* 需要注意，AlertDialog使用child大小来调节自身大小，使用如ListView，GridView和CustomScrollView将无法工作

### 构造方法
``` dart
AlertDialog({
  Key key,
  this.title,
  this.titlePadding,
  this.content,
  this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
  this.actions,
  this.semanticLabel,
  this.shape,
})
```

### 属性介绍
* title: 对话框的标题（可选）
* titlePadding: 标题的周围填充
* content: 对话框的（可选）内容以较浅的字体显示在对话框的中央
* contentPadding: 内容的周围填充
* action: 显示在对话框底部的可选操作集
* semanticLabel: 可访问性框架用于在打开和关闭对话框时通知屏幕转换的对话框的语义标签
* shape: 对话框边框的形状