import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PreviewPage extends StatelessWidget {
  final String title;
  final String content;
  const PreviewPage({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('预览: $title')),
      body: Markdown(
        data: content,
        selectable: true,
      ),
    );
  }
}
