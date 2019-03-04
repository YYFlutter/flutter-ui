## **ScrollController** 
> 控制滚动组件滚动位置，监听与设置滚动位置。一般使用在滚动组件中的controller属性
- 如ListView/PageView/GridView...

### 构造函数
```
ScrollController({
  double initialScrollOffset = 0.0,
  this.keepScrollOffset = true,
  this.debugLabel,
})
```

### 属性介绍
- initialScrollOffset double 初始化滚动位置
- debugLabel: String, 滚动时返回打印的内容, 当存在多滚动条组件时可进行区别.
- keepScrollOffset, bool, 默认true时存储滚动位置,初始为0. 当为false时,则不存储滚动位置
