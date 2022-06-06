import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registration_form_task/model/user_model.dart';
import 'package:registration_form_task/services/database/users_database.dart';
import 'package:registration_form_task/services/print_service/print_msg.dart';
import 'package:registration_form_task/view/home_view.dart';
import '../view/registration_view.dart';

class LoginViewModel extends GetxController{

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final ValueNotifier<bool> _logging = ValueNotifier(false);
  ValueNotifier<bool> get logging => _logging;

  login(){
    _logging.value = true;
    update();

    UserModel model = UserModel(password.text.trim(), '', email.text.trim(), '');
    UsersStorage.getUsers();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      _logging.value = false;
      update();
      print('Length: ${UsersStorage.users.length}');
      UsersStorage.users.forEach((element) {
        if(element.email == model.email && element.password == model.password){
          print('Login Successfully!');
          ShowMessage.printMessage('Login Successfully!');
          model = UserModel(element.password, element.phone, element.email, element.fullName);
          Get.to(() => HomeView(userModel: model));
        }
      });
    });

  }

  goToRegister(){
    Get.offAll(() => const RegistrationView());
  }
}