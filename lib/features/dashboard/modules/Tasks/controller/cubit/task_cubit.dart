// ignore_for_file: unnecessary_import, implementation_imports, prefer_final_fields, unused_field, await_only_futures, use_build_context_synchronously

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/firestore.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/local_db.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:flutter_project/features/dashboard/view/page/dashboard_page.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial()) {
    init();
  }
  final TextEditingController _taskController = TextEditingController();
  TextEditingController get taskController => _taskController;

  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> onChangeDate(date) async {
    selectedDate = date;
    await init();
  }

  Future<void> init() async {
    if (isClosed) return;
    emit(TaskLoading());
    tasks = [];
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      tasks = await (await Firestore.instance)
          .fetch(DateFormat.yMMMMd().format(selectedDate).toString());
      log(tasks.length.toString());
    } else {
      // local dataBase
      log("local db");
      LocalDb repo = LocalDb();
      emit(TaskLoading());
      await repo.initTaskDb();
      tasks =
          await repo.fetch(DateFormat.yMMMMd().format(selectedDate).toString());
    }
    if (tasks.isEmpty) {
      if (!isClosed) emit(TaskEmpty());
    } else {
      if (!isClosed) emit(TaskLoaded(tasks: tasks));
    }
  }

  Future<void> delete(BuildContext context, String docId) async {
    if (isClosed) return;
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      (await Firestore.instance).delete(docId: docId);
    } else {
      // local database
      await LocalDb().delete(docId: docId);
    }
    if (!isClosed) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    }
  }

  Future<void> toggleCheckbox(TaskModel task) async {
  final index = tasks.indexWhere((c) => c.docId == task.docId);
  tasks[index] = tasks[index].copyWith(isChecked: !task.isChecked);
  emit(TaskLoaded(tasks: tasks));

  final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    await Firestore.instance.updateTask(
      docId: task.docId!,
      newTitle: task.title,
      isChecked: !task.isChecked,
    );
  } else {
    await LocalDb().updateTasklocal(
      task,
      task.title,
      !task.isChecked,
    );
  }
}

  Future<void> updateTask(TaskModel task, String newTitle) async {
    emit(TaskLoading());
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      await Firestore.instance.updateTask(
        docId: task.docId!,
        newTitle: newTitle,
        isChecked: task.isChecked,
      );
    } else {
      await LocalDb().updateTasklocal(
        task,
        newTitle,
        task.isChecked,
      );
    }
    final index = tasks.indexWhere((c) => c.docId == task.docId);
    tasks[index] = tasks[index].copyWith(title: newTitle);
    emit(TaskLoaded(tasks: tasks));
  }
}
