## **Wrap**

>
该控件以多个水平或垂直方向显示其子控件
* 单行的Wrap和Row表现几乎一致，单列的Wrap和Column表现几乎一致，但是Row同Column系单行单列的，Wrap中行或列空间不足时，会自动换行

### 构造方法
``` dart
Wrap({
  Key key,
  this.direction = Axis.horizontal,
  this.alignment = WrapAlignment.start,
  this.spacing = 0.0,
  this.runAlignment = WrapAlignment.start,
  this.runSpacing = 0.0,
  this.crossAxisAlignment = WrapCrossAlignment.start,
  this.textDirection,
  this.verticalDirection = VerticalDirection.down,
  List<Widget> children = const <Widget>[],
})
```

### 属性介绍
* direction：主轴的方向，默认为水平，值：Axis.horizontal/vertical
* alignment：主轴方向上的对齐方式，默认为start, 值： WrapAlignment.start/center/end/spaceAround/spaceBetween/spaceEvenly
* spacing：主轴方向上的间距。
* runAlignment：run的对齐方式, 值： WrapAlignment.start/center/end/spaceAround/spaceBetween/spaceEvenly
* runSpacing：run的间距。
* crossAxisAlignment：交叉轴（crossAxis）方向上的对齐方式,值: WrapCrossAlignment.start/center/end
* textDirection：文本方向, 值：TextDirection.ltr/rtl
* verticalDirection：定义了children摆放顺序，默认是down,值： VerticalDirection.down/up
* children: Table的中的内容widget
