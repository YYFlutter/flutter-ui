## **AssetBundle**
> 抽象类，资源读取

#### 使用
```
import 'package:flutter/services.dart' show rootBundle;

getText() async {
  String text = await rootBundle.loadString('locale/zh.json');
  print('text $text');
}

```