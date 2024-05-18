// ignore_for_file: avoid_print

import 'package:flutter_project/features/dashboard/modules/add_task/model/category_model.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDb {
  static late Database taskDb;

  Future<void> initTaskDb() async {
    final String taskDatabasePath = await getDatabasesPath();
    final path = join(taskDatabasePath, 'todolist.db');
    taskDb = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database taskdb, _) async {
    await taskdb.execute("""
    CREATE TABLE task (
      docId INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      note TEXT,
      date TEXT NOT NULL,
      startTime TEXT,
      endTime TEXT,
      categoryId INTEGER,
      FOREIGN KEY (categoryId) REFERENCES category(docId)
    )""");

    await taskdb.execute("""
    CREATE TABLE category (
      docId INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL
    )""");
  }

  Future<void> addTask(String title, String note, String date, String startTime,
      String endTime, String categoryId) async {
    await taskDb.insert('task', {
      'title': title,
      'note': note,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'categoryId': categoryId,
    });
    taskDb.close();
  }

  Future<void> addCategory(String name) async {
    await taskDb.insert('category', {
      'name': name,
    });
    taskDb.close();
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final List<Map<String, dynamic>> categories = await taskDb.query('category');
    return categories.map((e) => CategoryModel(
          docId: e['docId'].toString(),
          name: e['name'] as String,
        )).toList();
  }

  Future<List<TaskModel>> fetchTasksForCategory(String categoryId) async {
    final List<Map<String, dynamic>> tasks = await taskDb.query(
      'task',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return tasks.map((e) => TaskModel(
          docId: e['docId']?.toString(),
          title: e['title'] as String,
          note: e['note'] as String?,
          date: e['date'] as String,
          startTime: e['startTime'] as String?,
          endTime: e['endTime'] as String?,
          categoryId: e['categoryId']?.toString(),
        )).toList();
  }

  Future<List<TaskModel>> fetch(String date) async {
    final List<Map<String, dynamic>> tasks = await taskDb.query(
      'task',
      where: 'date = ?',
      whereArgs: [date],
    );
    return tasks.map((e) => TaskModel(
          docId: e['docId']?.toString(),
          title: e['title'] as String,
          note: e['note'] as String?,
          date: e['date'] as String,
          startTime: e['startTime'] as String?,
          endTime: e['endTime'] as String?,
          categoryId: e['categoryId']?.toString(),
        )).toList();
  }

  Future<void> editTaskInfo(String title, String note, String date,
      String startTime, String endTime, String categoryId, String docId) async {
    await taskDb.update(
        'task',
        {
          'title': title,
          'note': note,
          'date': date,
          'startTime': startTime,
          'endTime': endTime,
          'categoryId': categoryId,
        },
        where: 'docId=?',
        whereArgs: [docId]);
  }

  Future<void> delete({required String docId}) async {
    await taskDb.delete(
      'task',
      where: 'docId=?',
      whereArgs: [docId],
    );
  }
}