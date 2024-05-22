// ignore_for_file: avoid_print

import 'package:flutter_project/features/dashboard/modules/add_task/model/category_model.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDb {
  static late Database taskDb;

  Future<void> initTaskDb() async {
    final String taskDatabasePath = await getDatabasesPath();
    final path = join(taskDatabasePath, 'todolist1.db');
    taskDb = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );

    final List<Map<String, dynamic>> categories =
        await taskDb.query('category', where: 'name = ?', whereArgs: ['All']);
    if (categories.isEmpty) {
      await taskDb.insert('category', {'name': 'All'});
    }
  }

  static Future<void> _createTables(Database taskdb, _) async {
    await taskdb.execute("""
    CREATE TABLE taskss (
      docId INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      note TEXT,
      date TEXT NOT NULL,
      startTime TEXT,
      endTime TEXT,
      categoryId INTEGER,
      isChecked INTEGER DEFAULT 0,
      FOREIGN KEY (categoryId) REFERENCES category(docId)
    )""");

    await taskdb.execute("""
    CREATE TABLE category (
      docId INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL
    )""");
  }

  Future<CategoryModel> addCategory(String name) async {
    final int newDocId = await taskDb.insert('category', {'name': name});
    return CategoryModel(docId: newDocId.toString(), name: name);
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final List<Map<String, dynamic>> categories =
        await taskDb.query('category', where: 'name != ?', whereArgs: ['All']);
    return categories
        .map((e) => CategoryModel(
              docId: e['docId'].toString(),
              name: e['name'] as String,
            ))
        .toList();
  }

  Future<void> updateCategory(CategoryModel category, String newName) async {
    await taskDb.update(
      'category',
      {'name': newName},
      where: 'docId = ?',
      whereArgs: [category.docId],
    );
  }

  Future<void> deleteCategory(String categoryId) async {
    await taskDb.delete(
      'category',
      where: 'docId = ?',
      whereArgs: [categoryId],
    );
  }

  Future<void> addTask(String title, String note, String date, String startTime,
      String endTime, String categoryId) async {
    await taskDb.insert('taskss', {
      'title': title,
      'note': note,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'categoryId': categoryId,
      'isChecked': 0,
    });
    taskDb.close();
  }

  Future<List<TaskModel>> fetchTasksForCategory(String categoryId) async {
    final List<Map<String, dynamic>> tasks = await taskDb.query(
      'taskss',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return tasks
        .map((e) => TaskModel(
              docId: e['docId']?.toString(),
              title: e['title'] as String,
              note: e['note'] as String?,
              date: e['date'] as String,
              startTime: e['startTime'] as String?,
              endTime: e['endTime'] as String?,
              categoryId: e['categoryId']?.toString(),
              isChecked: e['isChecked'] == 1,
            ))
        .toList();
  }

  Future<List<TaskModel>> fetchAllTasks() async {
    final List<Map<String, dynamic>> tasks = await taskDb.query('taskss');
    return tasks
        .map((e) => TaskModel(
              docId: e['docId']?.toString(),
              title: e['title'] as String,
              note: e['note'] as String?,
              date: e['date'] as String,
              startTime: e['startTime'] as String?,
              endTime: e['endTime'] as String?,
              categoryId: e['categoryId']?.toString(),
              isChecked: e['isChecked'] == 1,
            ))
        .toList();
  }

  Future<List<TaskModel>> fetch(String date) async {
    final List<Map<String, dynamic>> tasks = await taskDb.query(
      'taskss',
      where: 'date = ?',
      whereArgs: [date],
    );
    return tasks
        .map((e) => TaskModel(
              docId: e['docId']?.toString(),
              title: e['title'] as String,
              note: e['note'] as String?,
              date: e['date'] as String,
              startTime: e['startTime'] as String?,
              endTime: e['endTime'] as String?,
              categoryId: e['categoryId']?.toString(),
              isChecked: e['isChecked'] == 1,
            ))
        .toList();
  }

  Future<void> updateTasklocal(
      TaskModel task, String newTitle, bool isChecked) async {
    await taskDb.update(
      'taskss',
      {
        'title': newTitle,
        'isChecked': isChecked ? 1 : 0,
      },
      where: 'docId = ?',
      whereArgs: [task.docId],
    );
  }

  Future<void> delete({required String docId}) async {
    await taskDb.delete(
      'taskss',
      where: 'docId=?',
      whereArgs: [docId],
    );
  }
}
