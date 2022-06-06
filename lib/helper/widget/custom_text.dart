import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final Alignment alignment;
  final bool isFontBold;
  final TextAlign textAlign;
  final int maxLines;
  final TextDecoration textDecoration;
  final TextDirection textDirection;
  final String fontFamily;
  final bool customWeight;
  final FontWeight fontWeight;
  final double height;
  final double paddingRight;
  final double paddingLeft;

  const CustomText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontSize = 18,
      this.isFontBold = false,
      this.textAlign = TextAlign.start,
      this.alignment = Alignment.topLeft,
      this.maxLines = 1,
      this.textDecoration = TextDecoration.none,
      this.textDirection = TextDirection.ltr,
      this.fontFamily = 'Main',
      this.customWeight = false,
      this.fontWeight = FontWeight.normal,
        this.height = 1.2,
        this.paddingRight = 0,
        this.paddingLeft = 0,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: paddingRight, left: paddingLeft),
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        textDirection: textDirection,
        style: TextStyle(
            fontSize: fontSize,
            height: height,
            color: color,
            decoration: textDecoration,
            fontFamily: fontFamily,
            fontWeight: customWeight? fontWeight : isFontBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
