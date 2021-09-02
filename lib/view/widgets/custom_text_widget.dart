import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'size_calculator.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {Key key,
      this.fontSize,
      this.fontWeight,
      this.centerText = false,
      this.color,
      this.leftMargin = 0.0,
      this.topMargin = 0.0,
      this.rightMargin = 0.0,
      this.bottomMargin = 0.0,
      this.letterSpacing,
      this.textAlign,
      this.maxLines,
      this.fontFamily})
      : super(key: key);
  final String text;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double leftMargin;
  final double letterSpacing;
  final maxLines;
  final double topMargin;
  final double rightMargin;
  final double bottomMargin;
  final bool centerText;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenAwareSize(leftMargin ?? 0, context),
        screenAwareSize(topMargin ?? 0, context),
        screenAwareSize(rightMargin ?? 0, context),
        screenAwareSize(bottomMargin ?? 0, context),
      ),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines ?? 1,
        style: GoogleFonts.nunito(
            letterSpacing: letterSpacing,
            //   fontFamily: fontFamily ?? 'Crossten',
            fontSize: screenAwareSize(fontSize ?? 16, context, width: true),
            fontWeight: fontWeight,
            color: color),
      ),
    );
  }
}
