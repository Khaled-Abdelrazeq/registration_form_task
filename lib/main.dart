import 'package:flutter/material.dart';
import 'package:registration_form_task/services/database/users_database.dart';
import 'package:registration_form_task/view/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  UsersStorage.createDatabase();

  runApp(MyApp());
}
