import 'package:flutter_project/features/dashboard/modules/add_task/model/category_model.dart';

abstract class ManageCategoriesState {}

class ManageCategoriesInitial extends ManageCategoriesState {}

class ManageCategoriesLoading extends ManageCategoriesState {}

class ManageCategoriesEmpty extends ManageCategoriesState {}

class ManageCategoriesLoaded extends ManageCategoriesState {
  final List<CategoryModel> categories;

  ManageCategoriesLoaded({required this.categories});
}

