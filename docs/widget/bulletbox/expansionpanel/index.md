## **ExpansionPanel**

>
扩展面板，包含一个标题和一个正文，可以展开或折叠，面板正文在展开时可见
* ExpansionPanel不能单独使用，只能配合ExpansionPanelList使用
* ExpansionPanelList必须配合可以滑动的组件才可以使用

### ExpansionPanelList构造方法
``` dart
ExpansionPanelList({
  Key key,
  this.children = const <ExpansionPanel>[],
  this.expansionCallback,
  this.animationDuration = kThemeAnimationDuration,
})
```

### ExpansionPanel构造方法
``` dart
ExpansionPanel({
  @required this.headerBuilder,
  @required this.body,
  this.isExpanded = false
})
```

### ExpansionPanelList属性介绍
* children：ExpansionPanel内容
* expansionCallback：点击展开关闭面板回调函数
* animationDuration：展开面板时间

### ExpansionPanel属性介绍
* headerBuilder：标题构造器
* body：内容区域
* isExpanded：是否展开
