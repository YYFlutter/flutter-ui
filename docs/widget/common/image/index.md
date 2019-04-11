## **Image**

>
用于展示图片的控件，支持本地图片，资源图片，网络图片等加载方式

### 构造方法
``` dart
Image({
    Key key,
    @required this.image,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.color,
    this.colorBlendMode,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.filterQuality = FilterQuality.low,
  })
```

### 属性介绍
* image：
    * Image(): 通用方法，使用ImageProvider（包括：AssetImage, NetworkImage, FileImage, MemoryImage）实现，如下方法本质上也是使用这个方法
    * Image.asset: 加载资源图片
    * Image.file: 加载本地图片文件夹
    * Image.network: 加载网络图片
    * Image.memory: 加载Uint8List资源图片
* width：图片容器宽度
* height：图片容器高度
* color：color一般和colorBlendMod配合使用
* colorBlendMode：和color配合使用，添加滤镜效果
* fit：如何将图像分配到布局空间中
    * BoxFit.fill : 全图显示，显示尽可能拉伸，充满
    * BoxFit.contain : 全图显示，显示原比例，不需充满
    * BoxFit.cover : 显示可能拉伸，可能裁剪，充满
    * BoxFit.fitWidth : 显示尽可能拉伸，可能裁剪，宽度充满
    * BoxFit.fitHeight 显示尽可能拉伸，可能裁剪，高度充满:
    * BoxFit.none 无fit:
    * BoxFit.scaleDown 效果和contain差不多，但此属性不允许显示超过原图片大小，可小不可大:
* alignment = Alignment.center：控制图片的显示位置
* repeat = ImageRepeat.noRepeat：图片是否重复
* centerSlice：九个补丁图像的中心切片
* matchTextDirection = false：若值为turn，与Directionality配合使用，图片显示方向
* gaplessPlayback = false：当ImageProvider发生变化后，重新加载图片的过程中，原图片的展示是否保留。若值为true，保留，若为false，不保留，直接空白等待下一张图片加载
* filterQuality = FilterQuality.low：用于设置图像的FilterQuality