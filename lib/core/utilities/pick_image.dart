import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  log("No Images Selected");
}
final currentUser = FirebaseAuth.instance.currentUser!;
final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<String> uploadImage(String childName, Uint8List file) async {
  Reference ref = _storage.ref().child(childName).child(currentUser.uid);
  UploadTask uploadTask = ref.putData(file);
  TaskSnapshot snapshot = await uploadTask;
  String downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}

Future<String> saveImage({required Uint8List file}) async {
  
  String resp = "Some Error Occurred";
  try {
    
    String url = await uploadImage("profileImage", file);
    await _firestore.collection("Users").doc(currentUser.email!).update({"image": url});
    
    
    resp = "success";
  } catch (e) {
    resp = e.toString();
  }
  return resp;
}
