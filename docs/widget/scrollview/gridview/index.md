## ***GridView***

>  GridView是自带滚动的二维列表组件。

### 构造方法
```
GridView({
  Key key,
  Axis scrollDirection: Axis.vertical,
  bool reverse: false,
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  bool shrinkWrap: false,
  EdgeInsetsGeometry padding,
  @required SliverGridDelegate gridDelegate,
  bool addAutomaticKeepAlives: true,
  bool addRepaintBoundaries: true,
  bool addSemanticIndexes: true,
  double cacheExtent,
  List<Widget> children: const [],
  int semanticChildCount
})
```
### 进阶用法
```
GridView.builder // 动态加载，用于分页较多
GridView.count // 指定数据加载
GridView.custom
GridView.extent
```

### 用例
* GridView.count 
>
crossAxisCount：必填，指定列数
children: 子组件
reverse：默认false, 当为true时反转滚动方向，即上到下反转成下到上，左到右反转成右到左
controller:  ScrollController类，能初始化滚动相关的属性，如位置，也能监听滚动变化
primary: 默认true, 当填充数量调试不足以产生滚动条，滚动组件时，不影响最外层滚动条，即界面不随着手势滚动。
primary: false, 且controller=null（或者ScrollContorller中的initialScrollOffset属性为0），GridView.count的数量较少不足产生滚动条时，滚动主体为最外层滚动条。
physics: ScrollPhysics类，影响视图与用户输入交互。
shrinkWrap: 默认false, 滚动视图内容展开和收缩时不重新计算视图大小，例如外层height=200, 滚动的内容可能增加了expendTile，展开后的内容超过了200高，这时候会报错，此时修改shrinkWrap=true，即滚动视图会重新计算。
scrollDirection：默认Axis.vertical.，垂直方向，可通过Axis.horizontal修改为水平方向。
mainAxisSpacing:  主轴方向间距, 主轴方向由scrollDirection确定
crossAxisSpacing:  副轴方向间距,
childAspectRatio: 子元素中宽高比，宽度由ViewPort/crossAxisCount确定
 
```
GridView.count(
  crossAxisCount: 3,
  reverse: false,
  scrollDirection: Axis.vertical,
  controller: ScrollController(
    initialScrollOffset: 0.0,
  ),
  crossAxisSpacing: 10.0,
  mainAxisSpacing: 20.0,
  childAspectRatio: 2,
  physics: BouncingScrollPhysics(),
  primary: false,
  children: List.generate(15, (index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.redAccent,
        ),
      ),
      child: Center(
        child: Text('Item $index',
            style: Theme.of(context).textTheme.headline),
      ),
    );
   }, growable: false),
 ),
);
```

>ScrollPhysics类: 
* BouncingScrollPhysics，ClampingScrollPhysics，AlwaysScrollableScrollPhysics，NeverScrollableScrollPhysics