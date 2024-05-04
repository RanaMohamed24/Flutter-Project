import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';

abstract class ParentRepo {
  Future<void> addTask(
      String title, String note, String date, String startTime, String endTime);
  Future<void> editTask(
      String date, String startTime, String endTime, int docId);
  Future<List<TaskModel>> fetch();
  Future<List<TaskModel>> fetchCompleted();
  Future<void> delete({required int docId});
}
