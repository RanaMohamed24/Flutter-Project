part of 'add_tasks_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskLoaded extends AddTaskState {}

final class AddTaskEmpty extends AddTaskState {}

final class AddTaskDeletion extends AddTaskState {}
