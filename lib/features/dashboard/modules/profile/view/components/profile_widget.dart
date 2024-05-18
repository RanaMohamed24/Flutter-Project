import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utilities/pick_image.dart';
import 'package:flutter_project/features/dashboard/modules/profile/controller/cubit/profile_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/profile/view/components/user_data.dart';
import 'package:flutter_project/theme.dart';
import 'package:image_picker/image_picker.dart';

class ProfileWidget extends StatefulWidget {
  final ProfileCubit controller;
  ProfileWidget({super.key, required this.controller});

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection("Users");
  Uint8List ?_image;
   String? _imageUrl;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    String resp = await saveImage(file: img);
    if (resp == "success") {
      setState(() {
        _image = img;
      });
    }
  }

  Future<void> editField(BuildContext context, String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Edit " + field,
                  style: TextStyle(color: SecondaryColor)),
              content: TextField(
                autofocus: true,
                style: TextStyle(color: SecondaryColor),
                decoration: InputDecoration(
                  hintText: "Enter new $field",
                  hintStyle: TextStyle(color: SecondaryColor),
                ),
                onChanged: (value) => newValue = value,
              ),
              actions: [
                TextButton(
                  child: Text(
                    "cancel",
                    style: TextStyle(color: SecondaryColor),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text(
                    'save',
                    style: TextStyle(color: SecondaryColor),
                  ),
                  onPressed: () => Navigator.of(context).pop(newValue),
                ),
              ],
            ));
    if (newValue.trim().length > 0) {
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value:widget.controller,
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userdata = snapshot.data!.data() as Map<String, dynamic>;
              _imageUrl = userdata['image'] ?? _imageUrl;
              return BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Stack(
                        children: [
                             CircleAvatar(
                            radius: 67,
                            backgroundImage: _image != null
                                ? MemoryImage(_image!)
                                : _imageUrl != null
                                    ? NetworkImage(_imageUrl!) as ImageProvider
                                    : const NetworkImage(
                                        'https://th.bing.com/th/id/OIP.c5KXw-wPcnwyyBNayoXfFQAAAA?rs=1&pid=ImgDetMain'),
                          ),
                          Positioned(
                            child: IconButton(
                              onPressed: selectImage,
                              icon: Icon(Icons.add_a_photo),
                            ),
                            bottom: -7,
                            left: 70,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        currentUser.email!,
                        textAlign: TextAlign.center,
                        style: subTitle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      UserData(
                          text: userdata['username'],
                          sectionName: 'username :',
                          changeName: () => editField(context, "username")),
                      UserData(
                          text: userdata['bio'],
                          sectionName: 'Bio :',
                          changeName: () => editField(context, "bio")),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: TextFieldColor,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: SecondaryColor,
                                offset: Offset(0, 2),
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'LogOut',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: SecondaryColor),
                              ),
                              IconButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut();
                                     Navigator.of(context).pushReplacementNamed('login');
                                  },
                                  icon: const Icon(
                                    Icons.logout,
                                    color: SecondaryColor,
                                  )),
                            ],
                          )),
                    ]),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
