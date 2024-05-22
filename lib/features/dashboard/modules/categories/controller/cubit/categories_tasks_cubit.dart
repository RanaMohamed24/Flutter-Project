// ignore_for_file: use_build_context_synchronously, await_only_futures

import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/category_model.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/firestore.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/local_db.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_state.dart';
import 'package:flutter_project/features/dashboard/view/page/dashboard_page.dart';

class CategoriesTasksCubit extends Cubit<CategoriesTasksState> {
  CategoriesTasksCubit() : super(CategoriesTasksInitial()) {
    fetchCategories();
  }

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  TextEditingController get taskController => _taskController;

  List<CategoryModel> categories = [];
  String selectedCategory = "All";
  List<TaskModel> tasks = [];

  TextEditingController get categoryController => _categoryController;

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      categories = await Firestore.instance.fetchCategories();
    } else {
      categories = await LocalDb().fetchCategories();
    }

    if (!categories.any((category) => category.name == 'All')) {
      categories.insert(0, CategoryModel(docId: '0', name: 'All'));
    }
    categories = categories;
    if (!isClosed) {
      emit(CategoriesLoaded());
    }
  }

  Future<List<TaskModel>> fetchTasksForCategory(String categoryId) async {
    emit(TasksLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return await Firestore.instance.fetchTasksForCategory(categoryId);
    } else {
      return await LocalDb().fetchTasksForCategory(categoryId);
    }
  }

  Future<void> fetchAllTasks() async {
    emit(TasksLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      tasks = await Firestore.instance.fetchAllTasks();
    } else {
      tasks = await LocalDb().fetchAllTasks();
    }
    if (!isClosed) {
      if (tasks.isEmpty) {
        emit(TasksEmpty());
      } else {
        emit(TasksLoaded(tasks: tasks));
      }
    }
  }

  void selectCategory(String category) {
    selectedCategory = category;
    if (category == 'All') {
      fetchAllTasks();
    } else {
      final String selectedCategoryId =
          categories.firstWhere((c) => c.name == category).docId.toString();
      fetchTasksForCategory(selectedCategoryId);
    }
  }

  Future<void> delete(BuildContext context, String docId) async {
    if (isClosed) return;
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      await Firestore.instance.delete(docId: docId);
    } else {
      await LocalDb().delete(docId: docId);
    }
    if (!isClosed) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    }
  }

  Future<void> updateTask(
      TaskModel task, String newTitle, bool isChecked) async {
    emit(TasksLoading());
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      await Firestore.instance.updateTask(
          docId: task.docId as String,
          newTitle: newTitle,
          isChecked: task.isChecked);
    } else {
      await LocalDb().updateTasklocal(task, newTitle, isChecked);
    }
    final index = tasks.indexWhere((t) => t.docId == task.docId);
    if (index != -1) {
      tasks[index] = tasks[index].copyWith(title: newTitle);
    } else {
      tasks.add(task.copyWith(title: newTitle));
    }
    emit(TasksLoaded(tasks: tasks));
  }

  Future<void> toggleCheckbox(TaskModel task) async {
    emit(TasksLoading());

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

    final updatedTasks = await fetchTasksForCategory(task.categoryId as String);
    final index = updatedTasks.indexWhere((c) => c.docId == task.docId);
    if (index != -1) {
      updatedTasks[index] =
          updatedTasks[index].copyWith(isChecked: !task.isChecked);
      emit(TasksLoaded(tasks: updatedTasks));
    } else {
      log('Task not found in the tasks list');
    }
  }
}
