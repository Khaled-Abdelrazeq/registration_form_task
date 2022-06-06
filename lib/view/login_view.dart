import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registration_form_task/constants/color_manager.dart';
import 'package:registration_form_task/constants/font_mnager.dart';
import 'package:registration_form_task/constants/size_manager.dart';
import 'package:registration_form_task/helper/widget/custom_button.dart';
import 'package:registration_form_task/helper/widget/custom_registeration_text_form_field.dart';
import 'package:registration_form_task/helper/widget/custom_text.dart';
import 'package:registration_form_task/view_model/login_view_model.dart';
import 'package:registration_form_task/view_model/registration_view_model.dart';

import '../helper/widget/custom_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomHeader(text: 'Login',),

                const SizedBox(height: SizeManager.spaceAfterHeader),

                GetBuilder<LoginViewModel>(
                    init: LoginViewModel(),
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.all(SizeManager.screenPadding),
                        child: Column(
                          children: [

                            CustomRegistrationTextFormField(
                                hintText: 'Email',
                                validateText: 'Email is required!',
                                textInputType: TextInputType.emailAddress,
                                onSaveFunction: (value){},
                                prefixIcon: const Icon(Icons.email),
                                controller: controller.email),

                            const SizedBox(height: SizeManager.sizeBetweenData,),

                            CustomRegistrationTextFormField(
                                hintText: 'Password',
                                validateText: 'Password is required!',
                                obscureText: true,
                                textInputType: TextInputType.visiblePassword,
                                onSaveFunction: (value){},
                                prefixIcon: const Icon(Icons.key),
                                controller: controller.password),

                            const SizedBox(height: SizeManager.spaceBetweenLogoAndText,),

                            controller.logging.value?
                            const CircularProgressIndicator()
                            :CustomButton(text: 'Login', onPressed: (){
                              controller.login();
                            }),

                            const SizedBox(height: SizeManager.spaceBetweenLogoAndText,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomText(text: 'Don\'t have an account? ', fontSize: FontManager.small, color: ColorManager.text,),
                                GestureDetector(
                                    onTap: (){
                                      controller.goToRegister();
                                    },
                                    child: const CustomText(text: 'Register', fontSize: FontManager.small, color: ColorManager.login,)),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                )
              ],
            ),
          )
      ),
    );
  }
}

