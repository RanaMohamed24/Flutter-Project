// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/category_model.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';

class Firestore {
  static Firestore instance = Firestore();
  CollectionReference Tasks = FirebaseFirestore.instance.collection('Tasks');
  CollectionReference Categories =
      FirebaseFirestore.instance.collection('Categories');

  Future<CategoryModel> addCategory(String name) async {
    final DocumentReference newDoc = await Categories.add({'name': name});
    return CategoryModel(docId: newDoc.id, name: name);
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .where('name', isNotEqualTo: 'All')
        .get();
    return querySnapshot.docs.map((DocumentSnapshot document) {
      return CategoryModel(
        docId: document.id,
        name: document['name'],
      );
    }).toList();
  }

  Future<void> updateCategory(String categoryId, String newName) async {
    await Categories.doc(categoryId).update({'name': newName});
  }

  Future<void> deleteCategory(String categoryId) async {
    await Categories.doc(categoryId).delete();
  }

  Future<List<TaskModel>> fetchTasksForCategory(String categoryId) async {
    final QuerySnapshot querySnapshot =
        await Tasks.where('categoryId', isEqualTo: categoryId).get();
    return querySnapshot.docs.map((DocumentSnapshot document) {
      final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      data['docId'] = document.id;
      return TaskModel.fromJson(data);
    }).toList();
  }

  Future<List<TaskModel>> fetchAllTasks() async {
    final QuerySnapshot querySnapshot = await Tasks.get();
    return querySnapshot.docs.map((DocumentSnapshot document) {
      final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      data['docId'] = document.id;
      return TaskModel.fromJson(data);
    }).toList();
  }

  Future<List<TaskModel>> fetch(String date) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Tasks')
        .where('date', isEqualTo: date)
        .get();
    final List<TaskModel> tasks = [];
    for (final DocumentSnapshot document in querySnapshot.docs) {
      final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      data['docId'] = document.id;
      final TaskModel task = TaskModel.fromJson(data);
      tasks.add(task);
    }
    return tasks;
  }

  Future<void> addTask({
    required String title,
    String? note,
    required String date,
    String? startTime,
    String? endTime,
    required String categoryId,
    required bool isChecked,
  }) async {
    await Tasks.add({
      "title": title,
      'note': note,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'categoryId': categoryId,
      'isChecked': isChecked,
    });
  }

  Future<void> updateTask({
    required String docId,
    required String newTitle,
    required bool isChecked,
  }) async {
    await Tasks.doc(docId).update({
      'title': newTitle,
      'isChecked': isChecked,
    });
  }

  Future<void> delete({required String docId}) async {
    await Tasks.doc(docId).delete();
  }
}