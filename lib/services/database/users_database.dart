import 'package:flutter/foundation.dart';
import 'package:registration_form_task/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../constants/strings.dart';
import '../print_service/print_msg.dart';

class UsersStorage{
  static late Database database;

  static createDatabase() {
    openDatabase(USER_DATABASE, version: 1, onCreate: (db, version) {
      if(kDebugMode) debugPrint('Database Created!');
      db
          .execute('CREATE TABLE $USER_TABLE ('
          ' name TEXT, email TEXT, phone TEXT, password TEXT)')
          .then((value) {
        if(kDebugMode) debugPrint('Table Created!');
      }).catchError((e) {
        if(kDebugMode) debugPrint('Error When Created Table ${e.toString()}');
      });
    }, onOpen: (db) {
      if(kDebugMode) debugPrint('Database Opened!');
    }).then((value) {
      database = value;
    });
  }

  // static List<dynamic> users = [];
  static List<UserModel> users = [];

  static insertToDatabase(
      {required UserModel model}) async {
    getUsers();


    Future.delayed(const Duration(seconds: 1)).then((value) async {
      List<String> emails = [];
      users.forEach((element) {
        print('Element: $element ${users.length}');
        emails.add(element.email);
      });

      print('From Add: ${model.email}');
      // if(users.contains(model.email)){
      if(emails.contains(model.email)){
        debugPrint('emails from $USER_TABLE database class ${users.length}');
        if(kDebugMode) debugPrint('Already added');
        ShowMessage.printMessage('User Already Registered!');
      }else {
        await database.transaction((txn) async {
          await txn
              .rawInsert(
              'INSERT INTO $USER_TABLE(name, email, phone, password) '
                  'VALUES("${model.fullName}", "${model
                  .email}", "${model.phone}", "${model.password}")')
              .then((value) {
            if (kDebugMode) debugPrint('$value  Inserted Successfully!');
            ShowMessage.printMessage('User Registered Successfully!');
          }).catchError((e) {
            if (kDebugMode) debugPrint('Error when insert data $e');
          });
        }
        );
      }
    });
  }

  static getUsers(){
    users = [];
    database.rawQuery('Select * From $USER_TABLE').then((value){
      print(value);
      value.forEach((element) {
        users.add(UserModel.fromJson(element));
        // users.add(element['email']);
        print('From getUsers ${element['email']}');
      });
    }).catchError((e){
      if(kDebugMode) debugPrint('Error in getting users $e');
    });

  }

  static getDataFromDatabase() async{
    return database.rawQuery('Select * From $USER_TABLE');
  }

  static void deleteFromDatabase({required dynamic email}) {
    database.rawDelete('DELETE FROM $USER_TABLE WHERE email = ?', [email]).then((value) {
      // getDataFromDatabase();
      ShowMessage.printMessage('User deleted successfully!');
    }).catchError((e) {
      if(kDebugMode) debugPrint('Error when deleting row $e');
    });
  }

}