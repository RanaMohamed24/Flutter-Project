import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';

abstract class CategoriesTasksState {}

class CategoriesTasksInitial extends CategoriesTasksState {}

class CategoriesLoading extends CategoriesTasksState {}

class CategoriesLoaded extends CategoriesTasksState {}
class CategoriesEmpty extends CategoriesTasksState {}

class TasksLoading extends CategoriesTasksState {}

class TasksLoaded extends CategoriesTasksState {
  final List<TaskModel> tasks;

  TasksLoaded({required this.tasks});
}

class TasksEmpty extends CategoriesTasksState {}


