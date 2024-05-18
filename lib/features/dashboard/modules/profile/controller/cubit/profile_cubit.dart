// profile_cubit.dart
// ignore_for_file: library_private_types_in_public_api

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection("Users");
  Uint8List? _image;
  String? _imageUrl;

  Uint8List? get image => _image;
  String? get imageUrl => _imageUrl;

  void updateImage(Uint8List image) {
    _image = image;
    _imageUrl = null;
    emit(ProfileImageChanged(image: _image, imageUrl: _imageUrl));
  }

  Future<void> editField(BuildContext context, String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $field"),
        content: TextField(
          autofocus: true,
          onChanged: (value) => newValue = value,
        ),
        actions: [
          TextButton(
            child: const Text('cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('save'),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );
    if (newValue.trim().isNotEmpty) {
      await userCollection.doc(currentUser.email).update({field: newValue});
      emit(ProfileFieldUpdated());
    }
  }

  Future<String> saveImage({required Uint8List file}) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images/${currentUser.email}.jpg');
    await storageRef.putData(file);
    final downloadUrl = await storageRef.getDownloadURL();
    await userCollection.doc(currentUser.email).update({'image': downloadUrl});
    return downloadUrl;
  }
}
