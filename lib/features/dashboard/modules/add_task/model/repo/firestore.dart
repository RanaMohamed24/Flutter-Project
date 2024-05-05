import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';

class Firestore {
  static Firestore instance = Firestore();
  CollectionReference Tasks = FirebaseFirestore.instance.collection('Tasks');

  Future<List<TaskModel>> fetch(String date) async {
    log(date);
    return await FirebaseFirestore.instance
        .collection('Tasks')
        .where('date', isEqualTo: date)
        .get()
        .then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((e) {
        //final Map  data = e.data() as Map;
        log(e.reference.id.toString());
        Map m = {
          'title': e['title'],
          'note': e['note'],
          'date': e['date'],
          'startTime': e['startTime'],
          'endTime': e['endTime'],
          'docId': e.reference.id,
        };
        return TaskModel.fromJson(m);
      }).toList();
    });
  }

  Future<void> addTask(
      {required String title,
      String? note,
      required String date,
      String? startTime,
      String? endTime}) async {
    await Tasks.add({
      "title": title,
      'note': note,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
    })
        .then((value) => print("Task Added"))
        .catchError((error) => print("Failed to add task: $error"));
  }

  Future<void> delete({required String docId}) async {
    CollectionReference Tasks = FirebaseFirestore.instance.collection('Tasks');
    await Tasks.doc(docId.toString())
        .delete()
        .then((_) => print('Deleted task'));
  }
}
