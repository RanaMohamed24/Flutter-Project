import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/category_model.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/firestore.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/local_db.dart';
import 'package:flutter_project/features/dashboard/modules/manage_categories/controller/cubit/manage_categories_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ManageCategoriesCubit extends Cubit<ManageCategoriesState> {
  ManageCategoriesCubit() : super(ManageCategoriesInitial()) {
    fetchCategories();
  }

  final TextEditingController _categoryController = TextEditingController();
  TextEditingController get categoryController => _categoryController;
  List<CategoryModel> categories = [];

  Future<void> fetchCategories() async {
    emit(ManageCategoriesLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      categories = await Firestore.instance.fetchCategories();
    } else {
      categories = await LocalDb().fetchCategories();
    }
    categories.removeWhere((category) => category.name == 'All');
    if (categories.isEmpty) {
      emit(ManageCategoriesEmpty());
    } else {
      emit(ManageCategoriesLoaded(categories: categories));
    }
  }

  Future<void> addCategory(String categoryName) async {
    emit(ManageCategoriesLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final newCategory = await Firestore.instance.addCategory(categoryName);
      categories.add(newCategory);
    } else {
      final newCategory = await LocalDb().addCategory(categoryName);
      categories.add(newCategory);
    }
    _categoryController.clear();
    emit(ManageCategoriesLoaded(categories: categories));
  }

  Future<void> updateCategory(CategoryModel category, String newName) async {
    emit(ManageCategoriesLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      await Firestore.instance.updateCategory(category.docId, newName);
    } else {
      await LocalDb().updateCategory(category, newName);
    }
    final index = categories.indexWhere((c) => c.docId == category.docId);
    categories[index] = categories[index].copyWith(name: newName);
    emit(ManageCategoriesLoaded(categories: categories));
  }

  Future<void> deleteCategory(CategoryModel category) async {
    emit(ManageCategoriesLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      await Firestore.instance.deleteCategory(category.docId);
    } else {
      await LocalDb().deleteCategory(category.docId);
    }
    categories.removeWhere((c) => c.docId == category.docId);
    if (categories.isEmpty) {
      emit(ManageCategoriesEmpty());
    } else {
      emit(ManageCategoriesLoaded(categories: categories));
    }
  }
}
