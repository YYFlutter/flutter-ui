import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as md;
import 'package:efox_flutter/utils/syntaxHighlighter.dart'
    show DartSyntaxHighlighter;

class Index extends StatelessWidget {
  final String data;
  Index(this.data);

  @override
  Widget build(BuildContext build) {
    return md.MarkdownBody(
        data: this.data, syntaxHighlighter: DartSyntaxHighlighter());
  }
}
