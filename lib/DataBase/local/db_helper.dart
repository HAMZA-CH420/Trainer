import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  LocalDataBase._();

  static getInstance() => LocalDataBase._();

  Database? db;

  Future<Database> getDb() async {
    if (db != null) {
      return db!;
    } else {
      db = await openDb();
      return db!;
    }
  }

  Future<Database> openDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dirPath = join(appDir.path, "Trainer.db");
    return await openDatabase(
      dirPath,
      onCreate: (db, version) {
        db.execute(
          "create table userList(id integer primary key autoincrement, userName text, email text,password text, phoneNumber text,goals text,type text)",
        );
      },
    );
  }

  Future<bool> newUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    String? goals,

    required String type,
  }) async {
    var db = await getDb();
    int rowsAffected = await db.insert("userList", {
      "userName": userName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "goals": goals,
      "type": type,
    });
    return rowsAffected > 0;
  }
}
