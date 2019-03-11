## **GridView**
> GridView是自带滚动的二维列表组件。

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

### 高级用法
```
GridView.builder // 动态加载，用于分页较多
GridView.count // 指定数据加载
GridView.custom
GridView.extent
```

### 用例
> GridView.count 
指定长度创建子组件
- crossAxisCount：必填，指定列数
- children: 子组件
- reverse：默认false, 当为true时反转滚动方向，即上到下反转成下到上，左到右反转成右到左
- controller:  ScrollController类，能初始化滚动相关的属性，如位置，也能监听滚动变化
- primary: 默认true, 当填充数量调试不足以产生滚动条，滚动组件时，不影响最外层滚动条，即界面不随着手势滚动。
- primary: false, 且controller=null（或者ScrollContorller中的initialScrollOffset属性为0），GridView.count的数量较少不足产生滚动条时，滚动主体为最外层滚动条。
- physics: ScrollPhysics类，影响视图与用户输入交互。
- shrinkWrap: 默认false, 滚动视图内容展开和收缩时不重新计算视图大小，例如外层height=200, 滚动的内容可能增加了expendTile，展开后的内容超过了200高，这时候会报错，此时修改shrinkWrap=true，即滚动视图会重新计算。
- scrollDirection：默认Axis.vertical.，垂直方向，可通过Axis.horizontal修改为水平方向。
- mainAxisSpacing:  主轴方向间距, 主轴方向由scrollDirection确定
- crossAxisSpacing:  副轴方向间距,
- childAspectRatio: 子元素中宽高比，宽度由ViewPort/crossAxisCount确定
 
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

> GridView.extent 
指定长度创建子组件
- maxCrossAxisExtent: 设置副轴最大单项宽度，如外层容器宽度100, maxCrossAxisExtent为50，单行显示2个widget，如果外层容器变成150,则单行显示3个widget.如果超过容器宽度，或者单行没法满足两个，则按照一行填充1个widget。下面代码可以通过修改scrollDirection方向来看到不同效果。

	```
	GridView.extent(
		scrollDirection: Axis.vertical,
		maxCrossAxisExtent: 150,
		mainAxisSpacing: 10,
		crossAxisSpacing: 10,
		childAspectRatio: 1,
		children: List.generate(
			10,
			(index) {
				return Container(
					decoration: BoxDecoration(
						border: Border.all(
							width: 0.1,
						)
					),
					child: Image.network('https://dianhu-1253537286.cos.eu-moscow.myqcloud.com/efoxfile/Moschat/ojbk.png'),
				);
			},
		),
	),
	```

> GridView.custom
动态创建子组件
- SliverGridDelegate gridDelegate : 布局相关
- SliverChildDelegate childrenDelegate：动态创建子组件
	```
		gridDelegate: SliverGridDelegateWithFixedCrossAxisCount // 单行最大数量布局
		gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
			crossAxisCount: 10, // 单行最大10个元素布局
		),
		gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent // 单列最大宽度布局
		gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
			maxCrossAxisExtent: 100, // 单列最大宽度100
		),
		childrenDelegate: SliverChildBuilderDelegate(	// 创建无限滚动
			(context, index) {
				return Container(
					child: Text('$index'),
				);
			},
			semanticIndexCallback: (widget, index) {	// 滚动时回调函数
				print('index $index');
			},
		),
		childrenDelegate: SliverChildListDelegate(	// 创建有数量的滚动
			List.generate(30, (index) {
				return Container(
					child: Text('index $index'),
				);
			}),
		),
	```
	
	```
	GridView.custom(
	//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
	//            crossAxisCount: 10, // 单行最大10个元素布局
	//          ),
					gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
						maxCrossAxisExtent: 100, // 单列最大宽度100
					),
	//        childrenDelegate: SliverChildBuilderDelegate(
	//          (context, index) {
	//            return Container(
	//              child: Text('$index'),
	//            );
	//          },
	//          // 滚动时回调函数
	//          semanticIndexCallback: (widget, index) {
	//            print('index $index');
	//          },
	//        ),
					// 数量滚滚动限制，类似GridView.count
					childrenDelegate: SliverChildListDelegate(
						List.generate(30, (index) {
							return Container(
								child: Text('index $index'),
							);
						}),
					),
				)
	```

> GridView.builder
按需创建组件，跟custom差不多，但增加itemCount来限制加载子组件最大值，itemCount取代childrenDelegate来动态创建组件。
- itemCount： 子组件最大数量，默认没有限制。效果跟GridView.custom一致
- gridDelegate：设置布局，单行最大布局数量或单列单项最大长度，参考GridView.custom
- itemBuilder：子组件动态加载回调方法，长度受itemCount值影响，itemCount不为0且存在时，数量需小于itemCount值
	```
	GridView.builder(
			itemCount: 31,
			gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
				crossAxisCount: 3, // 单行最大数量值
			),
			itemBuilder: (context, index) {
				print('index $index');
				return Center(
					child: Text('index $index'),
				);
			},
		),
	```
	
### 其它补充
> ScrollPhysics
- BouncingScrollPhysics
- ClampingScrollPhysics
- AlwaysScrollableScrollPhysics
- NeverScrollableScrollPhysics
> SliverGridDelegate
- SliverGridDelegateWithFixedCrossAxisCount
- SliverGridDelegateWithMaxCrossAxisExtent
> SliverChildDelegate
- SliverChildBuilderDelegate
- SliverChildListDelegate

### 实例

