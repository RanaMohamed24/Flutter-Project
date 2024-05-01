import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/controller/cubit/task_cubit.dart';

class TaskModel {
  String? docId;
   String? title;
   String? note;
   String? date;
   String? startTime;
  String? endTime;

  TaskModel(
    {this.docId,
     this.title,
     this.note,
     this.date,
     this.startTime,
     this.endTime});

  TaskModel.fromJson(Map map) {
    docId = map['docId'].toString();
    title = map[' title'];
    note = map['note'];
    date = map['date'];
    startTime = map['startTime'];
    endTime = map['endTime'];
  }
}
