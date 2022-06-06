import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registration_form_task/view/registration_view.dart';

import '../utils/binding.dart';

class MyApp extends StatefulWidget {

  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: const RegistrationView(),
    );
  }
}
