// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/controller/cubit/add_tasks_state.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/category_model.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/firestore.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/local_db.dart';
import 'package:flutter_project/features/dashboard/view/page/dashboard_page.dart';
import 'package:intl/intl.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial()) {
    fetchCategories();
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime? get selectedDate => _selectedDate;
  DateTime? get selectedStartTime => _selectedStartTime;
  DateTime? get selectedEndTime => _selectedEndTime;
  CategoryModel? get selectedCategory => _selectedCategory;

  DateTime? _selectedDate;
  DateTime? _selectedStartTime;
  DateTime? _selectedEndTime;
  CategoryModel? _selectedCategory;

  List<CategoryModel> categories = [];

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

  void setCategory(CategoryModel category) {
    _selectedCategory = category;
    categoryController.text = category.name;
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

  Future<void> fetchCategories() async {
    try {
      emit(AddTaskloading());
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        categories = await Firestore.instance.fetchCategories();
      } else {
        categories = await LocalDb().fetchCategories();
      }
      categories.removeWhere((category) => category.name == 'All');
      emit(CategoriesLoaded());
    } catch (e) {
      emit(AddTaskError(e.toString()));
    }
  }

  Future<void> addTask(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(AddTaskloading());
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        try {
          await Firestore.instance.addTask(
            title: titleController.text,
            note: noteController.text,
            date: dateController.text,
            startTime: startTimeController.text,
            endTime: endTimeController.text,
            categoryId: selectedCategory?.docId ?? '',
            isChecked: false,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
          emit(AddTaskloaded());
        } catch (e) {
          emit(AddTaskError(e.toString()));
        }
      } else {
        await LocalDb().addTask(
          titleController.text,
          noteController.text,
          dateController.text,
          startTimeController.text,
          endTimeController.text,
          selectedCategory?.docId ?? '',
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
        emit(AddTaskloaded());
      }
    }
  }
}
