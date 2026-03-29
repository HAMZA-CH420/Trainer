import 'package:flutter/material.dart';

import '../../../DataBase/local/db_helper.dart';

class SignUpProvider with ChangeNotifier {
  LocalDataBase localDataBase = LocalDataBase.getInstance();

  Future createUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    required String type,
  }) async {
    await localDataBase.newUser(
      userName: userName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      type: type,
    );
  }
}
