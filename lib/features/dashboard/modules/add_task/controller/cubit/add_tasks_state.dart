part of 'add_tasks_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}
final class AddTaskloading extends AddTaskState {}
final class AddTaskloaded extends AddTaskState {}
