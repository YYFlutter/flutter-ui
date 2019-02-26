## **Padding**
>
作为一个基础的控件，功能非常单一，给子节点设置padding属性
* 类似于前端中的 div + css设置padding的效果
* Container + padding = Padding

### 构造方法
```
Padding({
  Key key,
  @required this.padding,
  Widget child,
})
```

### 属性介绍
>
Padding 控件的padding属性必须设置，不能为空
* padding: 通过给定的padding值来隔开子组件，通过EdgeInsets类计算padding的大小
* child: Padding中的内容widget