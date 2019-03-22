## 开发者如何参与完善控件
> 开发者可以选择完善喜欢翻译的控件文档，或者增加控件Demo示例

* fork 一份到自己的仓库
* git clone （您的仓库地址） 拉取项目到本地
* 打开项目 flutter-ui/lib/config/index.dart，修改里面isPro变量为false，（目的加载本地文件）
* 
### 完善文档
* 完善控件文档的，如要完善Animate下的AnimationController控件的文档，您可打开flutter-ui/docs/widget/animate/animationcontroller/index.md，构建AnimationController控件的说明文档，该文档包括但不限于（控件介绍，控件构造方法，控件属性介绍）

### 增加控件demo  
* 完善控件的，如要完善Animate下的AnimationController控件，打开项目 flutter-ui/lib/widget/animate/animationcontroller/demo.dart，在此文件下构建您的demo运行即可看到效果

### 提交PR
* 最后将您的代码提Pull request到test分支，我们会定期merge发版

## 如何提交PR
* fork项目到自己仓库
* git clone （您的仓库地址）到本地
* 建立上游连接
    * git remote add upstream https://github.com/efoxTeam/flutter-ui
* 创建开发分支（非必须）
    * git checkout -b test
* 修改提交代码
    * git status
    * git add .
    * git commit -m 'feat: message'
    * git push origin test
* 同步代码
    * git fetch upstream
    * git merge upstream/test
    * git push origin test
* 提交PR
    * 到自己github仓库对应fork的项目下new pull request

## 提交消息规范     
+ feat：新功能（feature）
+ fix：修补bug
+ docs：文档（documentation）
+ style： 格式（不影响代码运行的变动）
+ refactor：重构（即不是新增功能，也不是修改bug的代码变动）
+ test：增加测试
+ chore：构建过程或辅助工具的变动

## 环境与构建
* 自行完成flutter环境配置
* 通过 fork 项目master分支代码，进入项目
* 切换flutter到master分支，步骤如下（若已切换可跳过）
  1. flutter channel master // 选择master分支
  2. flutter upgrade // 更新代码  
* 运行模拟器或真机 
* flutter run //运行程序
* flutter build apk //生成apk 

