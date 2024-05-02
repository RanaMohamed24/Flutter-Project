import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/dashboard/modules/users/model/user_model.dart';
class Firestore{
  static Firestore instance = Firestore();
    CollectionReference Tasks = FirebaseFirestore.instance.collection('Tasks');
     
  Future<void> delete({required int id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  Future<List<UserModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  Future<void> addTask({required String title, required String note ,required String date , required String startTime, required String endTime}) async{
         await Tasks
            .add({
              "title" :title  ,
              'note': note ,
              'date': date, 
              'startTime':startTime,  
              'endTime': endTime,                                       
              })
               .then((value) => print("Task Added"))
               .catchError((error) => print("Failed to add task: $error"));
  }
  }
      
    
     

      
   
    
    
  

 
            



