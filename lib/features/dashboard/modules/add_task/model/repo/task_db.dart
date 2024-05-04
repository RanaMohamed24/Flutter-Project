import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/ParentRepo.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskDatabaseRepo extends ParentRepo {
  static late Database taskDb;

  Future<void> initTaskDb() async {
    final String taskDatabasePath = await getDatabasesPath();

    final path = join(taskDatabasePath, 'tasks.db');

    taskDb = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database taskdb, _) async {
    await taskdb.execute("""
    CREATE TABLE tasks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title STRING NOT NULL,
      note TEXT,
      date STRING,
      startTime STRING,
      endTime STRING,
      isCompleted INTEGER
    )""");
  }

  @override
  Future<void> addTask(String title, String note, String date, String startTime,
      String endTime) async {
    await taskDb.insert('tasks', {
      'title': title,
      'note': note,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'isCompleted': 0,
    });
    taskDb.close();
  }

  @override
  Future<void> delete({required int docId}) async {
    await taskDb.delete(
      'tasks',
      where: 'id=?',
      whereArgs: [docId],
    );
  }

  @override
  Future<List<TaskModel>> fetch() async {
    return (await taskDb.query('tasks'))
        .map((e) => TaskModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<TaskModel>> fetchCompleted() async {
    return (await taskDb.query('tasks', where: 'isCompleted=?', whereArgs: [1]))
        .map((e) => TaskModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> editTask(
      String date, String startTime, String endTime, int docId) async {
    await taskDb.update(
        'tasks',
        {
          'date': date,
          'startTime': startTime,
          'endTime': endTime,
        },
        where: 'id=?',
        whereArgs: [docId]);
  }
}
