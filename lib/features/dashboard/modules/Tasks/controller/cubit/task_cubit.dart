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

  DateTime selectedDate = DateTime.now();

  Future<void> onChangeDate(date) async {
    selectedDate = date;
    await init();
  }

  List<TaskModel> tasks = [];
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
      if (!isClosed) emit(TaskLoaded());
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
    task.isChecked = !task.isChecked;
    emit(TaskLoaded());
  }
}
