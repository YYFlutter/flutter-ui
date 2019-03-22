import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as md;
import 'package:efox_flutter/utils/syntaxHighlighter.dart'
    show DartSyntaxHighlighter;
import 'package:efox_flutter/config/color.dart' show materialColor;
import 'package:efox_flutter/config/theme.dart' show AppTheme;
import 'package:efox_flutter/store/index.dart' show model;

class Index extends StatelessWidget {
  final String data;
  Index(this.data);

  @override
  Widget build(BuildContext build) {
    return md.MarkdownBody(
        data: this.data, syntaxHighlighter: DartSyntaxHighlighter());
  }
}
