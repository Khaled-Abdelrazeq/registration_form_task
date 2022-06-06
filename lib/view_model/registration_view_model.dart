import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registration_form_task/model/user_model.dart';
import 'package:registration_form_task/services/database/users_database.dart';
import 'package:registration_form_task/view/login_view.dart';

class RegistrationViewModel extends GetxController{

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  final ValueNotifier<bool> _registering = ValueNotifier(false);
  ValueNotifier<bool> get registering => _registering;

  register(){
    registering.value = true;
    update();
    UserModel model = UserModel(password.text.trim(), phone.text.trim(), email.text.trim(), fullName.text.trim());
    UsersStorage.insertToDatabase(model: model);

    Future.delayed(const Duration(seconds: 1)).then((value) {
      registering.value = false;
      update();
    });
    print(model.fullName);
  }

  goToLogin(){
    Get.offAll(() => const LoginView());
  }
}