// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/category_model.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';

class Firestore {
  static Firestore instance = Firestore();
  CollectionReference Tasks = FirebaseFirestore.instance.collection('Tasks');
  CollectionReference Categories =
      FirebaseFirestore.instance.collection('Categories');

  Future<void> addCategory(String name) async {
    try {
      await Categories.add({'name': name});
      print("Category Added");
    } catch (error) {
      print("Failed to add category: $error");
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Categories').get();
      return querySnapshot.docs.map((DocumentSnapshot document) {
        return CategoryModel(
          docId: document.id,
          name: document['name'],
        );
      }).toList();
    } catch (error) {
      print("Error fetching categories: $error");
      rethrow;
    }
  }

  Future<List<String>> fetchCategoryNames() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Categories').get();
      return querySnapshot.docs.map((DocumentSnapshot document) {
        return document['name'] as String;
      }).toList();
    } catch (error) {
      print("Error fetching categories: $error");
      rethrow;
    }
  }

  Future<List<TaskModel>> fetchTasksForCategory(String categoryId) async {
    try {
      final QuerySnapshot querySnapshot =
          await Tasks.where('categoryId', isEqualTo: categoryId).get();
      return querySnapshot.docs.map((DocumentSnapshot document) {
        final Map<String, dynamic> data =
            document.data() as Map<String, dynamic>;
        data['docId'] = document.id;
        return TaskModel.fromJson(data);
      }).toList();
    } catch (error) {
      print("Error fetching tasks for category: $error");
      rethrow;
    }
  }

  Future<List<TaskModel>> fetch(String date) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Tasks')
          .where('date', isEqualTo: date)
          .get();
      return querySnapshot.docs.map((e) {
        final Map<String, dynamic> m = {
          'docId': e.reference.id,
          'title': e['title'],
          'note': e['note'],
          'date': e['date'],
          'startTime': e['startTime'],
          'endTime': e['endTime'],
          'categoryId': e['categoryId'],
        };
        return TaskModel.fromJson(m);
      }).toList();
    } catch (error) {
      print("Error fetching tasks: $error");
      rethrow;
    }
  }

  Future<void> addTask({
    required String title,
    String? note,
    required String date,
    String? startTime,
    String? endTime,
    required String categoryId,
  }) async {
    try {
      await Tasks.add({
        "title": title,
        'note': note,
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'categoryId': categoryId,
      });
      print("Task Added");
    } catch (error) {
      print("Failed to add task: $error");
    }
  }

  Future<void> delete({required String docId}) async {
    try {
      await Tasks.doc(docId).delete();
      print('Deleted task');
    } catch (error) {
      print('Error deleting task: $error');
      rethrow;
    }
  }
}
