import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDb {
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
      date STRING NOT NULL,
      startTime STRING,
      endTime STRING
    )""");
  }

  Future<void> addTask(String title, String note, String date, String startTime,
      String endTime) async {
    await taskDb.insert('tasks', {
      'title': title,
      'note': note,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      // 'isCompleted': 0,
    });
    taskDb.close();
  }

  Future<List<TaskModel>> fetch(String date) async {
    final List<Map<String, dynamic>> tasks = await taskDb.query(
      'tasks',
      where: 'date = ?',
      whereArgs: [date],
    );
    return tasks.map((e) => TaskModel.fromJson(e)).toList();
  }

  // Future<List<TaskModel>> fetchCompleted() async {
  //   return (await taskDb.query('tasks', where: 'isCompleted=?', whereArgs: [1]))
  //       .map((e) => TaskModel.fromJson(e))
  //       .toList();
  // }

  Future<void> editTaskInfo(String title, String note, String date,
      String startTime, String endTime, int docId) async {
    await taskDb.update(
        'tasks',
        {
          'title': title,
          'note': note,
          'date': date,
          'startTime': startTime,
          'endTime': endTime,
        },
        where: 'id=?',
        whereArgs: [docId]);
  }

  // Future<void> editTaskState(int value, int docId) async {
  //   await taskDb.update(
  //       'tasks',
  //       {
  //         'isCompleted': value,
  //       },
  //       where: 'id=?',
  //       whereArgs: [docId]);
  // }

  Future<void> delete({required String docId}) async {
  await taskDb.delete(
    'tasks',
    where: 'id = ?',
    whereArgs: [docId], // Pass docId as String
  );
}

}
