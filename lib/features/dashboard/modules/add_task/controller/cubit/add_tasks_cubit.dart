import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/view/page/Tasks_page.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/task_db.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/firestore.dart';
import 'package:flutter_project/features/dashboard/view/page/dashboard_page.dart';
import 'package:intl/intl.dart';

part 'add_tasks_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskLoading()) {
    init();
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime? get selectedDate => _selectedDate;
  DateTime? get selectedStartTime => _selectedStartTime;
  DateTime? get selectedEndTime => _selectedEndTime;

  DateTime? _selectedDate;
  DateTime? _selectedStartTime;
  DateTime? _selectedEndTime;

  void setDate(DateTime date) {
    _selectedDate = date;
    dateController.text = DateFormat.yMMMMd().format(_selectedDate!);
  }

  void setStartTime(DateTime time) {
    _selectedStartTime = time;
    startTimeController.text =
        DateFormat("hh:mm a").format(_selectedStartTime!);
  }

  void setEndTime(DateTime time) {
    _selectedEndTime = time;
    endTimeController.text = DateFormat("hh:mm a").format(_selectedEndTime!);
  }

  void getDateFromUser(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      setDate(date);
      // log(date.toString());
    }
  }

  void getStartTimeFromUser(BuildContext context) async {
    TimeOfDay? startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (startTime != null) {
      setStartTime(DateTime(1, 1, 1, startTime.hour, startTime.minute));
    }
  }

  void getEndTimeFromUser(BuildContext context) async {
    TimeOfDay? endTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (endTime != null) {
      setEndTime(DateTime(0, 1, 1, endTime.hour, endTime.minute));
    }
  }

  void onPressedCreateButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Form is valid, proceed with adding task to database
      if (titleController.text.isNotEmpty) {
        repo.addTask(
            titleController.text,
            noteController.text,
            dateController.text,
            startTimeController.text,
            endTimeController.text);
        log("Added");
        // After adding the task, navigate to the TasksPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TasksPage()),
        );
      }
    }
  }

  List<TaskModel> tasks = [];
  TaskDatabaseRepo repo = TaskDatabaseRepo();
  Future<void> init() async {
    emit(AddTaskLoading());
    await repo.initTaskDb();
    tasks = await repo.fetch();

    if (tasks.isEmpty) {
      emit(AddTaskEmpty());
    } else {
      emit(AddTaskLoaded());
    }
    void addTask(BuildContext context) async {
      emit(AddTaskloading());
      await Firestore.instance.addTask(
        title: titleController.text,
        note: noteController.text,
        date: dateController.text,
        startTime: startTimeController.text,
        endTime: endTimeController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
      emit(AddTaskloaded());
    }
  }
}
