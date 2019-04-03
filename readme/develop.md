# Flutter UI V1.0.0 代码规范

### 文件命名规范
##### 文件夹小写“单”词，复合词建议用下划线隔开
```
lib 
  |--components
  |--page
    |--app_login
```

不建议以下写法
```
lib 
  |--common-component  【X】
  |--commonComponent  【X】
  |--homepage 【X】
```
##### 文件名小写，多词建议用下划线
```
lib 
  |--components
    |--webview_component.dart
  |--page
```

不建议以下写法
```
lib 
  |--commonComponent.dart  【X】
  |--home-page.dart 【X】
```


### 引入库、类规范

##### 优先引入dart库 > 第三方工具包 > 本地工具包 > 其它包或类文件
```
/// 默认库
import 'dart:async';
import 'dart:material';
/// 第三方工具包
import 'package:third-packages.dart';
/// 本地工具包
import 'package:page/utils.dart';
/// 其它类文件
import 'package:page/app-login.dart';
```

##### 优先使用相对路径，引用外层目录时，建议使用绝对路径
```
/// 相对路径
import 'utils.dart';
/// 绝对文件
import 'package:efox_flutter/utils/local_storage.dart';
```

##### 使用库时，建议增加show、as方式标明引用对象，同时命名使用大驼峰
```
import 'utils.dart' as Utils;
/// 绝对文件
import 'package:efox_flutter/utils/local_storage.dart' show LocalStorage;
```


### 类命名规范

##### 类名建议使用大驼峰命名
```
class DemoClass {
  const DemoClass([arg]);
}

@DemoClass(anArg)
class A { ... }
```


### 变量命名规范
##### 常量建议使用小驼峰进行命名
```
const pi = 3.14;
final numberReg = RegExp('\d+');
var name;
HttpRequest httpRequest;
var getName (int id) {
	// ...
}
```

不推荐如下写法

```
constPI = 3.14;
const NumberReg = RegExp('\d+');

class Animal {
  static final TYPE = 'Animal';
}
```
##### 变量默认值为null时，不需要赋值
```
var name;
```
不建议写法
```
var name = null;
```


### 流程控制
##### 减少else使用
```
if (name == null) return
print('user name is $name')
```

##### 减少拼接符操作，建议使用“\$"引入，类引用时通过“\${}”方式引用
```
var name = 'tiger'
User user = new User(name: 'kings', age: 12)
print('test name is $name')
print('user name is ${user.name}')
print('their are $name and ${user.name})
```


### 注释
##### 代码行内注释建议使用//
```
String getName (User user) {
	// return user's name
	return user.name;
}
```
##### 变量注释建议使用///
```
/// 定义常量值
const pi = 3.14;
```


### 类规范

##### 构造函数建议使用this直接引用变量

```
class Point {
  num x, y;
  Point(this.x, this.y);
}
```

##### 减少非必要this使用
```
class Person {
  var age;

  void setPerson (User user) {
    setAge(user.age);
  }

  void update(age) {
    this.age= age;
  }
}
```

##### 建议减少new写法
```
Widget build(BuildContext context) {
  return Center(
    child: Text('content'),
  );
}
```


### Future使用

##### 建议使用async/await

```
Future request(String path) async {
  var response = await dio.get(path);
  return response;
}
```




