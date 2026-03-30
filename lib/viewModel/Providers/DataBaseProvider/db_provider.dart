import 'package:flutter/material.dart';
import 'package:trainer/DataBase/local/db_helper.dart';

class DbProvider extends ChangeNotifier {
  LocalDataBase db = LocalDataBase.getInstance();

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    var user = await db.loginUser(email: email, password: password);
    return user != null ? true : false;
  }
}
