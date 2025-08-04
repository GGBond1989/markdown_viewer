import 'package:flutter/material.dart';

import '../models/markdown_tree_element.dart';
import 'builder.dart';

class HeadlineBuilder extends MarkdownElementBuilder {
  HeadlineBuilder({
    this.headline1,
    this.headline2,
    this.headline3,
    this.headline4,
    this.headline5,
    this.headline6,
    this.h1Padding,
    this.h2Padding,
    this.h3Padding,
    this.h4Padding,
    this.h5Padding,
    this.h6Padding,
    this.h1Decoration,
    this.h2Decoration,
    this.h3Decoration,
    this.h4Decoration,
    this.h5Decoration,
    this.h6Decoration,
  });

  TextStyle? headline1;
  TextStyle? headline2;
  TextStyle? headline3;
  TextStyle? headline4;
  TextStyle? headline5;
  TextStyle? headline6;
  EdgeInsets? h1Padding;
  EdgeInsets? h2Padding;
  EdgeInsets? h3Padding;
  EdgeInsets? h4Padding;
  EdgeInsets? h5Padding;
  EdgeInsets? h6Padding;
  BoxDecoration? h1Decoration;
  BoxDecoration? h2Decoration;
  BoxDecoration? h3Decoration;
  BoxDecoration? h4Decoration;
  BoxDecoration? h5Decoration;
  BoxDecoration? h6Decoration;


  @override
  TextStyle? buildTextStyle(element, defaultStyle) {
    final baseFontSize = defaultStyle.fontSize ?? 16;

    return defaultStyle.merge({
      "1": TextStyle(fontSize: baseFontSize * 1.6).merge(headline1),
      "2": TextStyle(fontSize: baseFontSize * 1.4).merge(headline2),
      "3": TextStyle(fontSize: baseFontSize * 1.2).merge(headline3),
      "4": TextStyle(fontSize: baseFontSize * 1.1).merge(headline4),
      "5": TextStyle(fontSize: baseFontSize).merge(headline5),
      "6": TextStyle(fontSize: baseFontSize).merge(headline6),
    }[element.attributes['level']]);
  }

  @override
  final matchTypes = ['headline'];

  @override
  EdgeInsets? blockPadding(element, parent) => {
        "1": h1Padding,
        "2": h2Padding,
        "3": h3Padding,
        "4": h4Padding,
        "5": h5Padding,
        "6": h6Padding,
      }[element.attributes['level']];


  @override
  Widget? buildWidget(MarkdownTreeElement element, MarkdownTreeElement parent) {
    final widget = super.buildWidget(element, parent);
    final boxDecoration = {
      "1": h1Decoration,
      "2": h2Decoration,
      "3": h3Decoration,
      "4": h4Decoration,
      "5": h5Decoration,
      "6": h6Decoration,
    }[element.attributes['level']];

    if (boxDecoration == null) {
      return widget;
    }
    
    return Container(
      width: double.infinity,
      decoration: boxDecoration,
      child: widget,
    );
  }
}
