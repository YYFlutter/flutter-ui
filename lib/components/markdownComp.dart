import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as md;

class MarkDownComp extends StatelessWidget {
  final String data;
  MarkDownComp(this.data);

  @override
  Widget build(BuildContext build ) {
    return md.MarkdownBody(data: this.data);
  }
}