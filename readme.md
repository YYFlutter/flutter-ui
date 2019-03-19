# Flutter UI
![android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png](android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png)

> flutter ui 开发者社区 提供各种flutter相关开发教程 与 demo

## 项目背景
* Google推出Flutter跨平台解决方案，渐渐地受到了开发者们的关注，结合dart使用，能够用一套代码实现开发iOS与Android两套应用，同时也是谷歌的下一代操作系统 Fuchsia 的开发框架，未来还将可以直接编译成桌面应用。
* Flutter拥有丰富的组件库，多样化的主题与UI风格，让开发者更简单的上手完成界面交互，从而提高了开发效率。
* 此套组件库在几次没有硝烟的研讨中，命名为"Flutter UI"，使命为"知识千万点，学习第一条。代码快点敲，bug无数行"。没错，就是这么不押韵。

## Release Apk 安装包   
![apk download](readme/apk.png)     
[历史版本](https://github.com/efoxTeam/flutter-ui/releases)

## 开发者如何参与完善控件
<img src="data:image/png;base64,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" width="300" />

欢迎有兴趣的小伙伴QQ扫描以上二维码参与进来，一同完善组件    
同时也可以把相关问题通过[issues](https://github.com/efoxTeam/flutter-ui/issues)方式与我们联系   
[开发者如何参与完善控件](readme/pr.md)



## 环境与构建
* 自行完成flutter环境配置
* 通过 fork 项目master分支代码，进入项目
* 切换flutter到master分支，步骤如下（若已切换可跳过）
  1. flutter channel master // 选择master分支
  2. flutter upgrade // 更新代码  
* 运行模拟器或真机 
* flutter run //运行程序
* flutter build apk //生成apk 

## app预览

![Alt 预览](readme/flutter_ui2.gif)
![Alt 预览](readme/flutter_ui3.gif)


## 目录
```
Flutter UI
  ├─assets      静态资源
  ├─docs      教程文件
  ├─locale      语言包
  ├─lib     dart执行代码
      ├─components
      ├─config  配置文件
      ├─controller
      ├─lang  多语言控制类
      ├─page  路由关联页面
      │  ├─component
      │  └─mine
      ├─router  路由
      ├─store 数据管理
      │  ├─models
      │  └─objects
      ├─utils 项目工具类
      └─widget  项目组件库
          ├─animate
          │  ├─animatedbuilder 【✔️ v1.0】
          │  ├─animatedcontainer
          │  ├─animatedcrossfade
          │  ├─animateddefaulttextstyle
          │  ├─animatedliststate
          │  ├─animatedmodalbarrier
          │  ├─animatedopacity
          │  ├─animatedphysicalmodel
          │  ├─animatedpositioned
          │  ├─animatedsize
          │  ├─animatedwidget
          │  ├─animatedwidgetbasestate
          │  ├─animationcontroller
          │  ├─decoratedboxtransition
          │  ├─fadetransition
          │  ├─hero
          │  ├─positionedtransition
          │  ├─rotationtransition
          │  ├─scaletransition
          │  ├─sizetransition
          │  └─slidetransition
          ├─bulletbox
          │  ├─alertdialog 【✔️ v1.0】
          │  ├─bottomsheet 【✔️ v1.0】
          │  ├─expansionPanel 【✔️ v1.0】
          │  ├─simpledialog 【✔️ v1.0】
          │  └─snackbar 【✔️ v1.0】
          ├─common
          │  ├─assetbundle
          │  ├─buttonbar
          │  ├─chip
          │  ├─container 【✔️ v1.0】
          │  ├─divider 【✔️ v1.0】
          │  ├─flatbutton 【✔️ v1.0】
          │  ├─icon 【✔️ v1.0】
          │  ├─iconbutton
          │  ├─image
          │  ├─listtile
          │  ├─placeholder
          │  ├─raisedbutton
          │  ├─rawimage
          │  ├─stepper
          │  ├─text 【✔️ v1.0】
          │  └─tooltip
          ├─form
          │  ├─checkbox 【✔️ v1.0】
          │  ├─checkboxlisttile 【✔️ v1.0】
          │  ├─slider  【✔️ v1.0】
          │  ├─switch  【✔️ v1.0】
          │  ├─switchListTile  【✔️ v1.0】
          │  ├─daypicker 【✔️ v1.0】
          │  ├─radio   【✔️ v1.0】
          │  ├─radioListTile   【✔️ v1.0】
          │  ├─form
          │  ├─formfield
          │  ├─rawkeyboard
          │  ├─textfield   【✔️ v1.0】
          │  └─textinput
          ├─gestures
          │  ├─absorbpointer
          │  ├─dismissible
          │  ├─dragtarget
          │  ├─gesturedetector
          │  ├─ignorepointer
          │  └─longpressdraggable 【✔️ v1.0】
          ├─navigator
          │  ├─appbar 【✔️ v1.0】
          │  ├─bottomnavigationbar 【✔️ v1.0】
          │  ├─drawer 【✔️ v1.0】
          │  ├─floatingactionbutton 【✔️ v1.0】
          │  ├─materialapp
          │  ├─navigator
          │  ├─popupmenubutton
          │  ├─scaffold 【✔️ v1.0】
          │  ├─tabbar
          │  ├─tabbarview
          │  └─widgetsapp
          ├─regular
          │  ├─align 【✔️ v1.0】
          │  ├─aspectratio 【✔️ v1.0】
          │  ├─center 【✔️ v1.0】
          │  ├─column 【✔️ v1.0】
          │  ├─constrainedbox 【✔️ v1.0】
          │  ├─container 【✔️ v1.0】
          │  ├─fittedbox 【✔️ v1.0】
          │  ├─flow 【✔️ v1.0】
          │  ├─layoutbuilder 【✔️ v1.0】
          │  ├─listbody 【✔️ v1.0】
          │  ├─listview 【✔️ v1.0】
          │  ├─padding 【✔️ v1.0】
          │  ├─row 【✔️ v1.0】
          │  ├─stack 【✔️ v1.0】
          │  ├─table 【✔️ v1.0】
          │  └─wrap 【✔️ v1.0】
          ├─scrollview
          │  ├─customscrollview 【✔️ v1.0】
          │  ├─gridview 【✔️ v1.0】
          │  ├─listview 【✔️ v1.0】
          │  ├─nestedscrollview 【✔️ v1.0】
          │  ├─scrollable 【✔️ v1.0】
          │  ├─scrollbar 【✔️ v1.0】
          │  ├─scrollcontroller 【✔️ v1.0】
          │  └─singlechildscrollview 【✔️ v1.0】
          └─vision
              ├─backdropfilter
              ├─clipoval
              ├─clippath
              ├─cliprect
              ├─custompaint
              ├─decoratedbox
              ├─fractionaltranslation
              ├─mediaquery
              ├─opacity
              ├─rotatedbox
              ├─theme
              └─transform
```

