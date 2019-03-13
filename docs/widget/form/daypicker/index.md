## **DatePicker**

>
显示给定月份的日期并允许选择一天
* 日期选择器很少直接使用,请考虑使用 showDatePicker 或者 showTimePicker，它会创建一个日期/时间选择器对话框

### showDatePicker构造方法
``` dart
showDatePicker({
  @required BuildContext context,
  @required DateTime initialDate,
  @required DateTime firstDate,
  @required DateTime lastDate,
  SelectableDayPredicate selectableDayPredicate,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  Locale locale,
  TextDirection textDirection,
  TransitionBuilder builder,
})
```

### showTimePicker构造方法
``` dart
showTimePicker({
  @required BuildContext context,
  @required TimeOfDay initialTime,
  TransitionBuilder builder,
})
```

### 属性介绍
* context: 上下文
* initialDate: 初始时间
* firstDate: 设置选择的最早时间
* lastDate: 设置选择的最晚时间
