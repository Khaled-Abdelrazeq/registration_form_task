import 'package:get/get.dart';
import 'package:registration_form_task/view_model/login_view_model.dart';

import '../view_model/registration_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationViewModel());
    Get.lazyPut(() => LoginViewModel());
  }
}
