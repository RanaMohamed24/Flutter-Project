part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

class AddTaskDateChanged extends AddTaskState {
  final DateTime selectedDate;

  AddTaskDateChanged(this.selectedDate);
}

class AddTaskStartTimeChanged extends AddTaskState {
  final DateTime selectedStartTime;

  AddTaskStartTimeChanged(this.selectedStartTime);
}

class AddTaskEndTimeChanged extends AddTaskState {
  final DateTime selectedEndTime;

  AddTaskEndTimeChanged(this.selectedEndTime);
}
