import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';

abstract class CategoriesTasksState {}

class CategoriesTasksInitial extends CategoriesTasksState {}

class CategoriesLoading extends CategoriesTasksState {}

class CategoriesLoaded extends CategoriesTasksState {}
class CategoriesEmpty extends CategoriesTasksState {}

class CategoriesError extends CategoriesTasksState {
  final String errorMessage;

  CategoriesError(this.errorMessage);
}

class TasksLoading extends CategoriesTasksState {}

class TasksLoaded extends CategoriesTasksState {
  final List<TaskModel> tasks;

  TasksLoaded({required this.tasks});
}

class TasksEmpty extends CategoriesTasksState {}

class TasksError extends CategoriesTasksState {
  final String errorMessage;

  TasksError(this.errorMessage);
}
