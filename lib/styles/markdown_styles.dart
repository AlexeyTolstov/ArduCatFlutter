import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

final MarkdownStyleSheet markdownStyleSheet = MarkdownStyleSheet(
  h1: const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
  p: const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  blockquote: const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontStyle: FontStyle.italic,
  ),
);

class CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    return HighlightView(
      element.textContent,
      language: 'cpp',
      theme: a11yLightTheme,
      padding: const EdgeInsets.all(8),
      textStyle: const TextStyle(
        fontFamily: 'monospace',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
