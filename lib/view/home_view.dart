import 'package:flutter/material.dart';
import 'package:registration_form_task/constants/color_manager.dart';
import 'package:registration_form_task/constants/font_mnager.dart';
import 'package:registration_form_task/helper/widget/custom_text.dart';
import 'package:registration_form_task/model/user_model.dart';

import '../constants/size_manager.dart';

class HomeView extends StatelessWidget {
  final UserModel userModel;
  const HomeView({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: 'Welcome ${userModel.fullName}', fontSize: FontManager.regular,
            alignment: Alignment.center, maxLines: 2,
              textAlign: TextAlign.center, color: ColorManager.primary,),

            const SizedBox(height: SizeManager.spaceAfterHeader,),

            CustomText(text: 'Your email is ${userModel.email}', fontSize: FontManager.small,
              alignment: Alignment.center, maxLines: 2,
              textAlign: TextAlign.center, color: ColorManager.text,),

            const SizedBox(height: SizeManager.spaceAfterHeader,),

            CustomText(text: 'Your phone is ${userModel.phone}', fontSize: FontManager.small,
              alignment: Alignment.center, maxLines: 2,
              textAlign: TextAlign.center, color: ColorManager.text,),

          ],
        ),
      ),
    );
  }
}
