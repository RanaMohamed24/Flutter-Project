part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}
final class TaskLoading extends TaskState {}
final class TaskLoaded extends TaskState {}
final class TaskEmpty extends TaskState{}






