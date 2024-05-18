abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskloading extends AddTaskState {}

class AddTaskloaded extends AddTaskState {}

class CategoriesLoaded extends AddTaskState {}

class AddTaskError extends AddTaskState {
  final String errorMessage;

  AddTaskError(this.errorMessage);
}