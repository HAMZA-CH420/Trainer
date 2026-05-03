import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  LocalDataBase._();

  static getInstance() => LocalDataBase._();

  Database? db;

  ///check whether if the database is present
  Future<Database> getDb() async {
    return db ??= await openDb();
  }

  /// open a new database if there is not one present
  Future<Database> openDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dirPath = join(appDir.path, "Trainer.db");
    return await openDatabase(
      dirPath,
      onCreate: (db, version) async {
        await db.execute(
          "create table userList(id integer primary key autoincrement, userName text, email text, password text, phoneNumber text, goals text, type text, userId text)",
        );
        await db.execute(
          "create table trainerProfile(id integer primary key autoincrement, userName text, userId text, about text, specialization text, experience text, hourlyRate text, rating real)",
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 3) {
          await db.execute("DROP TABLE IF EXISTS trainerProfile");
          await db.execute(
            "create table trainerProfile(id integer primary key autoincrement, userName text, userId text, about text, specialization text, experience text, hourlyRate text, rating real)",
          );
        }
      },
      version: 3,
    );
  }

  ///add a new user in the table
  Future<String?> newUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    required String type,
  }) async {
    String userId =
        "${userName.toLowerCase().replaceAll(' ', '_')}_${DateTime.now().millisecondsSinceEpoch}";

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

  ///get current user details
  Future<Map<String, dynamic>?> getUser({required String userId}) async {
    final db = await getDb();
    var results = await db.query(
      "userList",
      where: "userId = ?",
      whereArgs: [userId],
    );
    return results.isNotEmpty ? results.first : null;
  }

  ///add trainers profile in the table
  Future<bool?> addTrainerProfile({
    required String userId,
    required String userName,
    required String about,
    required String specialization,
    required String experience,
    required String hourlyRate,
    required double rating,
  }) async {
    var db = await getDb();
    int rowsAffected = await db.insert("trainerProfile", {
      "userName": userName,
      "userId": userId,
      "about": about,
      "specialization": specialization,
      "experience": experience,
      "hourlyRate": hourlyRate,
      "rating": rating,
    });
    return rowsAffected > 0 ? true : false;
  }

  ///this is a comment
  ///Retrieve trainers profile from the database
  Future<List<Map<String, dynamic>>> getTrainerProfile() async {
    var db = await getDb();
    return await db.query("trainerProfile");
  }

  ///update goals filed in the table
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

  ///retrieve goals from the data base
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

  ///login validation
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

  ///get all the users registered as trainers
  Future<List<Map<String, dynamic>>> getTrainer() async {
    var db = await getDb();
    return await db.query(
      "userList",
      where: "type = ?",
      whereArgs: ["TRAINER"],
    );
  }

  ///delete a user
  void deleteUser(String userId) async {
    var db = await getDb();
    await db.delete("userList", where: "userId = ?", whereArgs: [userId]);
  }
}
