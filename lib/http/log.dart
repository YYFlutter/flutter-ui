/**
 * 日志打印
 */
void log(title, message) {
  if (message == null) {
    print('$title');
  } else {
    print('$title');
    print('$message');
    print('end');
  };
}
