import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';

abstract class CategoriesTasksState {}

class CategoriesTasksInitial extends CategoriesTasksState {}

class CategoriesLoading extends CategoriesTasksState {}

class CategoriesLoaded extends CategoriesTasksState {}
class CategoriesEmpty extends CategoriesTasksState {}

final class TasksLoading extends CategoriesTasksState {}
final class TasksLoaded extends CategoriesTasksState {
   final List<TaskModel> tasks;

  TasksLoaded({required this.tasks});
}
final class TasksEmpty extends CategoriesTasksState{}