// ignore_for_file: use_build_context_synchronously, await_only_futures

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

  List<CategoryModel> categories = [];
  String selectedCategory = "";
  List<TaskModel> tasks = [];

  TextEditingController get categoryController => _categoryController;

  Future<void> fetchCategories() async {
    try {
      emit(CategoriesLoading());
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        categories = await Firestore.instance.fetchCategories();
      } else {
        categories = await LocalDb().fetchCategories();
      }
      emit(CategoriesLoaded());
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> addCategory(String categoryName) async {
    try {
      emit(CategoriesLoading());
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        await Firestore.instance.addCategory(categoryName);
      } else {
        await LocalDb().addCategory(categoryName);
      }
      categories.add(CategoryModel(docId: '', name: categoryName));
      _categoryController.clear();
      emit(CategoriesLoaded());
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> fetchTasksForCategory(String categoryId) async {
    try {
      emit(TasksLoading());
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        tasks = await Firestore.instance.fetchTasksForCategory(categoryId);
      } else {
        tasks = await LocalDb().fetchTasksForCategory(categoryId);
      }
      if (!isClosed) {
        if (tasks.isEmpty) {
          emit(TasksEmpty());
        } else {
          emit(TasksLoaded(tasks: tasks));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(TasksError(e.toString()));
      }
    }
  }

  void selectCategory(String category) {
    selectedCategory = category;
    final String selectedCategoryId =
        categories.firstWhere((c) => c.name == category).docId.toString();
    fetchTasksForCategory(selectedCategoryId);
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
        MaterialPageRoute(builder: (context) =>  DashboardPage()),
      );
    }
  }
}
