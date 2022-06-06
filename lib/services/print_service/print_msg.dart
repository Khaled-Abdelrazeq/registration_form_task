import 'package:get/get.dart';

class ShowMessage{
  static printMessage(String msg, {int milliSeconds = 1800}){
    Get.snackbar('Notification', msg, duration: Duration(milliseconds: milliSeconds));
  }
}