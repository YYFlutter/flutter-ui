## **Table**

>
该控件为其子控件进行table布局的Widget

### 构造方法
``` dart
Table({
  Key key,
  this.children = const <TableRow>[],
  this.columnWidths,
  this.defaultColumnWidth = const FlexColumnWidth(1.0),
  this.textDirection,
  this.border,
  this.defaultVerticalAlignment = TableCellVerticalAlignment.top,
  this.textBaseline,
})
```

### 属性介绍
>
该Widget适用于多行多列，若只有一行或者一列，选择Row或Column会更合适一些

* columnWidths：设置每一列的宽度
* defaultColumnWidth：默认的每一列宽度值，默认情况下均分，通过FixedColumnWidth设置
* textDirection：文字显示方向
* border：表格边框
* defaultVerticalAlignment：每一个cell的垂直方向的对齐方式, 包含5种：
  * top：放置在的顶部；
  * middle：垂直居中；
  * bottom：放置在底部；
  * baseline：文本baseline对齐；
  * fill：充满整个cell。
* textBaseline：defaultVerticalAlignment为baseline的时候，会用到这个属性。
* children: Table的中的内容widget