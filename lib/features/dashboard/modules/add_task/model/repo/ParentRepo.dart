// ignore_for_file: file_names

import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';

abstract class ParentRepo {
  Future<void> addTask();
  Future<List<TaskModel>> fetch() ;
  Future<void> delete({required int id});
}