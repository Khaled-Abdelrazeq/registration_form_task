import 'package:flutter/material.dart';
import 'package:registration_form_task/constants/color_manager.dart';
import 'package:registration_form_task/constants/font_mnager.dart';
import 'package:registration_form_task/constants/size_manager.dart';

class CustomRegistrationTextFormField extends StatelessWidget {
  final String hintText;
  final String validateText;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) onSaveFunction;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Color textColor;
  final double height;
  final double radius;
  final bool hasBorder;
  final TextEditingController controller;

  const CustomRegistrationTextFormField({
    Key? key,
    required this.hintText,
    required this.validateText,
    required this.onSaveFunction,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    required this.prefixIcon,
    this.suffixIcon = const Text(''),
    this.textColor = ColorManager.text,
    this.height = SizeManager.infoTextFormFieldHeight,
    this.radius = SizeManager.infoTextFormFieldRadius, this.hasBorder = true,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 2.5), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(color: textColor, fontSize: FontManager.small),
        onChanged: onSaveFunction,
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            return null;
          }
          return validateText;
        },
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: hasBorder? OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(radius)) : InputBorder.none,
          focusedBorder: hasBorder? OutlineInputBorder(
              borderSide: const BorderSide(color: ColorManager.primary),
              borderRadius: BorderRadius.circular(radius)) : InputBorder.none,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: FontManager.small),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
