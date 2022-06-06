import 'package:flutter/material.dart';
import 'package:registration_form_task/constants/color_manager.dart';
import 'package:registration_form_task/constants/font_mnager.dart';
import 'package:registration_form_task/constants/size_manager.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Alignment alignment;
  final Color backgroundColor;
  final Color textColor;
  final Function() onPressed;
  final double width;
  final bool isWidth;
  final double radius;
  final double height;

  const CustomButton(
      {Key? key,
      required this.text,
      this.fontSize = FontManager.regular,
      this.alignment = Alignment.center,
      this.backgroundColor = ColorManager.primary,
      this.textColor = ColorManager.white,
      required this.onPressed,
      this.width = 0,
      this.isWidth = false,
        this.radius = SizeManager.infoTextFormFieldRadius,
        this.height = SizeManager.infoTextFormFieldHeight,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: isWidth ? width : MediaQuery.of(context).size.width,
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          elevation: 5,
          color: backgroundColor,
          onPressed: onPressed,
          child:
              CustomText(
                text: text,
                alignment: Alignment.center,
                fontSize: fontSize,
                color: textColor,
                isFontBold: true,
                customWeight: true,
                fontWeight: FontWeight.w700,
              )

      ),

    );
  }
}
