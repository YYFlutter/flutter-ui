## **ConstrainedBox**

>
一个基础布局控件，添加额外的限制条件(constraints)到child上

### 构造方法
``` dart
ConstrainedBox({
  Key key,
  @required this.constraints,
  Widget child
})
```

### 属性介绍
* constraints: 添加到child上的额外限制条件，其类型为BoxConstraints，限制各种最大最小宽高
* child: ConstrainedBox中的内容Widget

### 其他用法
* constraints值为BoxConstraints.expand时，提供width或者height，那么限制（Constraints）将严格使用给出的width或者height值