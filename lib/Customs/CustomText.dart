import 'package:crepto/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final int? maxLines;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? overFlow;
  final FontStyle fontStyle;
  final String? fontFamily;
  final TextAlign textAlign;
  final double? letterSpacing;
  final TextDecoration? textDecoration;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.fontStyle = FontStyle.normal,
    this.fontFamily,
    this.overFlow,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Constants.getResponsiveFontSize(fontSize),
        color: color,
        decoration: textDecoration,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
      ),
      maxLines: maxLines,
      overflow: overFlow,
      textAlign: textAlign,
    );
  }
}

class CustomTextCenter extends StatelessWidget {
  final String text;
  final double fontSize;
  final int? maxLines;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? overFlow;
  final FontStyle fontStyle;
  final String? fontFamily;
  final TextAlign textAlign;
  final double? letterSpacing;
  final TextDecoration? textDecoration;

  const CustomTextCenter({
    super.key,
    required this.text,
    required this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.fontStyle = FontStyle.normal,
    this.fontFamily,
    this.overFlow,
    this.textAlign = TextAlign.center,
    this.letterSpacing,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: Constants.getResponsiveFontSize(fontSize),
          color: color,
          decoration: textDecoration,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
          letterSpacing: letterSpacing,
        ),
        maxLines: maxLines,
        overflow: overFlow,
        textAlign: textAlign,
      ),
    );
  }
}