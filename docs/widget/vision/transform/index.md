## **Transform**

> 在绘制子元素前应用转换的组件

### 构造方法
```
Transform({
  Key key, 
  @required Matrix4 transform,
  Offset origin,
  AlignmentGeometry alignment,
  bool transformHitTests: true,
  Widget child
})
```

### 属性介绍
origin：坐标系的原点（相对于此渲染对象的左上角）应用矩阵的原点
alignment：原点的对齐方式
transform： 在绘制过程中改变子元素的矩阵
transformHitTests：在测试时是否执行转换


### 实例
