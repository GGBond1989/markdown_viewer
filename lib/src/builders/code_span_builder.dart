import 'package:flutter/material.dart';
import 'builder.dart';

class CodeSpanBuilder extends MarkdownElementBuilder {
  CodeSpanBuilder({
    super.context,
    TextStyle? textStyle,
  }) : _textStyle = textStyle;

  @override
  final matchTypes = ['codeSpan'];

  final TextStyle? _textStyle;

  @override
  TextStyle? buildTextStyle(element, defaultStyle) {
    Color color;
    if (darkMode) {
      color = const Color(0Xffca4219);
    } else {
      color = const Color(0xff8b1c1c);
    }

    final style = super.buildTextStyle(element, defaultStyle)?.merge(TextStyle(
          color: color,
          fontFamily: 'monospace',
        ).merge(_textStyle));

    return style;
  }

  @override
  Widget? buildWidget(element, parent) {
    final richText = element.children.single as RichText;

    // The purpose of this is to make the RichText has the same line height as
    // it should be while the line height of TextSpan has been changed to 1.
    // return renderer.createRichText(
    //   richText.text as TextSpan,
    //   strutStyle: StrutStyle(height: _lineHeight, forceStrutHeight: true),
    // );

    Color backgroundColor;
    if (darkMode) {
      backgroundColor = const Color(0Xff424242);
    } else {
      backgroundColor = const Color(0x10000000);
    }

    return renderer.createRichText(
      WidgetSpan(
        child: Transform.translate(
          offset: const Offset(0, 2),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            decoration: BoxDecoration(
              color: _textStyle?.backgroundColor ?? backgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: richText,
          ),
        ),
      ),
    );
  }
}
