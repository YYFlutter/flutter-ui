## **SingleChildScrollView**
> 当组件内容超出可视范围或高度时，可增加SingleChildScrollView，通过滚动解决问题

### 构造函数

```
SingleChildScrollView({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    bool primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.down,
});
```

### 属性介绍
> 滚动参数很多同等gridview介绍。

### 用例
> 在固定容器超出屏幕高度则滚动显示
```
  Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.blue,
      ),
    ),
    height: 100,
    child: SingleChildScrollView(
      child: Text(
        '这里是高度100，增加SingleChildScrollView, 内容超过时可滚动。这里是高度100，增加SingleChildScrollView, 内容超过时可滚动。这里是高度100，增加SingleChildScrollView, 内容超过时可滚动。这里是高度100，增加SingleChildScrollView, 内容超过时可滚动。',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    ),
  )
```
