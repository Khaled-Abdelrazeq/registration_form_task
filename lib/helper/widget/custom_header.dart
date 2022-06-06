import 'package:flutter/material.dart';

import '../../constants/color_manager.dart';
import '../../constants/size_manager.dart';
import 'custom_text.dart';

class CustomHeader extends StatelessWidget {
  final String text;
  const CustomHeader({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: SizeManager.customHeaderHeight,
      decoration: BoxDecoration(
        color: ColorManager.lightPrimary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeManager.customHeaderRadius),
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: SizeManager.logoSize,
            width: SizeManager.logoSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              color: ColorManager.white,
            ),
          ),
          SizedBox(height: SizeManager.spaceBetweenLogoAndText,),
          CustomText(text: text, color: ColorManager.white, alignment: Alignment.bottomRight,
            textAlign: TextAlign.right, paddingRight: SizeManager.registerPaddingRight,),

          SizedBox(height: SizeManager.spaceBetweenLogoAndText,),
        ],
      ),
    );
  }
}