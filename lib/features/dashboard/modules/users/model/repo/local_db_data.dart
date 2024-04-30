// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:sqflite/sqflite.dart';

import '../user_model.dart';
import 'parent_data.dart';

class DatabaseRepo extends ParentRepo {
  DatabaseRepo._init();

  static DatabaseRepo? _singletoneObject;
  static late Database _database;

  static Future<DatabaseRepo> get instance async {
    if (_singletoneObject == null) {
      await _initDatabase();
      _singletoneObject = DatabaseRepo._init();
    }
    return _singletoneObject!;
  }

  //create database
  static Future<void> _initDatabase() async {
    //get database path on the target device
    final String databasePath = await getDatabasesPath();

    //add your database files
    final String path = databasePath + "/users.db";
    // final path = join(databasePath, 'users.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
      CREATE TABLE user (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT NOT NULL, 
      address TEXT )
    """);
  }

  @override
  Future<void> insert({required String name, String? address}) async {
    await _database.insert('user', {'name': name, 'address': address});
  }

  @override
  Future<List<UserModel>> fetch() async {
    return (await _database.query('user'))
        .map((e) => UserModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> delete({required Comparable<num> id}) async {
    await _database.delete('user', where: 'id=?', whereArgs: [id]);
  }
}
