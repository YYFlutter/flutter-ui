## 开发者如何参与完善控件
> 开发者可以选择只完善控件Demo示例，或者喜欢翻译的可以只完善控件文档，也可选择两者

* git clone https://github.com/efoxTeam/flutter-ui 拉取项目到本地
* 打开项目 flutter-ui/lib/config/index.dart，修改里面isPro变量为false，（目的加载本地文件）
* 完善控件的，如要完善Animate下的AnimationController控件，打开项目 flutter-ui/lib/widget/animate/animationcontroller/demo.dart，在此文件下构建您的demo运行即可看到效果
* 完善控件文档的，您可打开flutter-ui/docs/widget/animate/animationcontroller/index.md，构建AnimationController控件的说明文档，该文档包括但不限于（控件介绍，控件构造方法，控件属性介绍）
* 最后将您的代码提Pull request到test分支，我们会定期merge发版

## PR规范
1. 确保一个PR只做一个issues或一个组件分享，或一个特殊的主题分享等，即命题唯一
2. 可通过pull request提交到test-pr分支，指定给任意管理员。
3. 明确标题性质，是issues还是改进的内容，描述背景，完善的实现方案或关键的解决要素，梳理对用户的影响与风险，罗列合并的内容与变更日志，相关后续规划
* 模板
```
# 标题: 如关于xxx问题的解决方案、关于xxx组件的分享
# 性质: 可选择issues/share/others
# 问题背景描述
    在xxx场景下，遇到了以下几点问题
    1，问题1...
    2，问题2...
    ...
# 解决方案：基于xxx问题，提供以下解决方案
    1，在xxx地方进行优化
    2，在xxx代码中进行优化
    ...
# 用户影响与风险
    1，xxx变动会影响xxx功能
    2，预期可能会存在xxx问题
    3，是否会隐藏哪些其它风险等
# 清单
    1，xxx文档
    2，罗列相关变动的文件
    3，代码视频或效果展示等内容
    4，change log等
# 后续规划
    1，xxx阶段实现xxx功能
    2，其它预期规划。
```
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
    * git commit -m 'feat: 增加了什么什么什么'
    * git push origin test
* 同步代码
    * git fetch upstream
    * git merge upstream/test
    * git push origin test
* 提交PR
    * 到自己github仓库对应fork的项目下new pull request

