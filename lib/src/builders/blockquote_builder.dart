import 'package:flutter/material.dart';

import '../helpers/is_dark_mode.dart';
import 'builder.dart';

class BlockquoteBuilder extends MarkdownElementBuilder {
  BlockquoteBuilder({
    super.context,
    TextStyle? textStyle,
    this.padding,
    this.decoration,
  }) : super(
          textStyle: TextStyle(
            color: isDarkMode(context)
                ? const Color(0xff999999)
                : const Color(0xff666666),
          ).merge(textStyle),
        );

  final EdgeInsets? padding;
  final BoxDecoration? decoration;

  @override
  final matchTypes = ['blockquote'];

  @override
  Widget? buildWidget(element, parent) {
    return Container(
      width: double.infinity,
      decoration: decoration ??
          BoxDecoration(
            border: Border(
              left: BorderSide(
                color: darkMode
                    ? const Color(0xff777777)
                    : const Color(0xffcccccc),
                width: 5,
              ),
            ),
          ),
      padding: padding ?? const EdgeInsets.only(left: 20),
      child: super.buildWidget(element, parent),
    );
  }
}
