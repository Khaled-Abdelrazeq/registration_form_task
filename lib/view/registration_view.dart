import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registration_form_task/constants/color_manager.dart';
import 'package:registration_form_task/constants/font_mnager.dart';
import 'package:registration_form_task/constants/size_manager.dart';
import 'package:registration_form_task/helper/widget/custom_button.dart';
import 'package:registration_form_task/helper/widget/custom_registeration_text_form_field.dart';
import 'package:registration_form_task/helper/widget/custom_text.dart';
import 'package:registration_form_task/view_model/registration_view_model.dart';

import '../helper/widget/custom_header.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomHeader(text: 'Register',),

                const SizedBox(height: SizeManager.spaceAfterHeader),
                
                GetBuilder<RegistrationViewModel>(
                  init: RegistrationViewModel(),
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.all(SizeManager.screenPadding),
                      child: Column(
                        children: [
                          CustomRegistrationTextFormField(
                              hintText: 'Full name',
                              validateText: 'Full name is required!',
                              textInputType: TextInputType.text,
                              onSaveFunction: (value){},
                              prefixIcon: const Icon(Icons.person),
                              controller: controller.fullName),

                          const SizedBox(height: SizeManager.sizeBetweenData,),

                          CustomRegistrationTextFormField(
                              hintText: 'Email',
                              validateText: 'Email is required!',
                              textInputType: TextInputType.emailAddress,
                              onSaveFunction: (value){},
                              prefixIcon: const Icon(Icons.email),
                              controller: controller.email),

                          const SizedBox(height: SizeManager.sizeBetweenData,),

                          CustomRegistrationTextFormField(
                              hintText: 'Phone number',
                              validateText: 'Phone number is required!',
                              textInputType: TextInputType.phone,
                              onSaveFunction: (value){},
                              prefixIcon: const Icon(Icons.phone),
                              controller: controller.phone),

                          const SizedBox(height: SizeManager.sizeBetweenData,),

                          CustomRegistrationTextFormField(
                              hintText: 'Password',
                              validateText: 'Password is required!',
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true,
                              onSaveFunction: (value){},
                              prefixIcon: const Icon(Icons.key),
                              controller: controller.password),

                          const SizedBox(height: SizeManager.spaceBetweenLogoAndText,),

                          controller.registering.value?
                          const CircularProgressIndicator()
                          :CustomButton(text: 'Register', onPressed: (){
                            controller.register();
                          }),

                          const SizedBox(height: SizeManager.spaceBetweenLogoAndText,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(text: 'Already a member? ', fontSize: FontManager.small, color: ColorManager.text,),
                              GestureDetector(
                                  onTap: (){
                                    controller.goToLogin();
                                  },
                                  child: const CustomText(text: 'Login', fontSize: FontManager.small, color: ColorManager.login,)),

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

