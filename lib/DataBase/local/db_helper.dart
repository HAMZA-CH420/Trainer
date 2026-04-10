import 'dart:convert';
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
          "create table userList(id integer primary key autoincrement, userName text, email text,password text, phoneNumber text,goals text,type text,userId text)",
        );
      },
      version: 1,
    );
  }

  Future<String?> newUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,

    required String type,
  }) async {
    String userId =
        "${userName.toLowerCase().replaceAll(' ', '_')}_${DateTime.now().millisecondsSinceEpoch}";
    //
    var db = await getDb();
    int rowsAffected = await db.insert("userList", {
      "userName": userName,
      "userId": userId,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "type": type,
    });
    return rowsAffected > 0 ? userId : null;
  }

  Future<bool> updateGoals({
    required String userId,
    required List<String> goals,
  }) async {
    var db = await getDb();
    String goalsJson = jsonEncode(goals);

    int count = await db.update(
      "userList",
      {"goals": goalsJson},
      where: "userId = ?",
      whereArgs: [userId],
    );
    return count > 0;
  }

  Future<List<String>> getGoals(String userId) async {
    var db = await getDb();
    var maps = await db.query(
      "userList",
      columns: ["goals"],
      where: "userId = ?",
      whereArgs: [userId],
    );

    if (maps.isNotEmpty && maps.first["goals"] != null) {
      String goalsJson = maps.first["goals"] as String;
      return List<String>.from(jsonDecode(goalsJson));
    }
    return [];
  }

  //login validation
  Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  }) async {
    var db = await getDb();
    var results = await db.query(
      "userList",
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );
    return results.isNotEmpty ? results.first : null;
  }

  Future<List<Map<String, dynamic>>> getTrainer() async {
    var db = await getDb();
    var results = db.query(
      "userList",
      where: "type = ?",
      whereArgs: ["TRAINER"],
    );
    return results;
  }
}
