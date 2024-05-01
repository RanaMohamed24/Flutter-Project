import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  DateTime selectedDate = DateTime.now();
  DateTime selectedStartTime = DateTime.now();
  DateTime selectedEndTime = DateTime.now();

  Future<void> getDateFromUser(BuildContext context) async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );

    if (pickerDate != null) {
      selectedDate = pickerDate;
      emit(AddTaskDateChanged(selectedDate));
    }
  }

  Future<void> getStartTimeFromUser(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedTime != null) {
      selectedStartTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      emit(AddTaskStartTimeChanged(selectedStartTime));
    }
  }

  Future<void> getEndTimeFromUser(BuildContext context) async {
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedEndTime != null) {
      selectedEndTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        pickedEndTime.hour,
        pickedEndTime.minute,
      );
      emit(AddTaskEndTimeChanged(selectedEndTime));
    }
  }
}
