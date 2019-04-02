## **Stepper**

>
一个步骤小控件，通过一系列步骤显示进度，对于表单的情况，Stepper特别有用，可以通过控制需要完成多个步骤才能提交的表单

### 构造方法
``` dart
Stepper({
    Key key,
    @required this.steps,
    this.physics,
    this.type = StepperType.vertical,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    })
```

### 属性介绍
* steps: Stepper的内容，包含标题，副标题，内容
* physics: Stepper滚动视图应如何响应用户输入
* type = StepperType.vertical: 确定Stepper的布局类型
* currentStep: 当前步骤索引，内容被显示
* onStepTapped: step被点击时的回调
* onStepContinue: 点击 继续 按钮时的回调
* onStepCancel: 点击 取消 按钮时的回调
* controlsBuilder: 用于创建自定义控件的回调