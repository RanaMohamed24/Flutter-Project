import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/build_context_extension.dart';
import 'package:flutter_project/core/cubit/parent_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/profile/controller/cubit/profile_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/profile/view/components/profile_image.dart';
import 'package:flutter_project/features/dashboard/modules/profile/view/components/user_data.dart';
import 'package:flutter_project/core/utilities/theme.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required ProfileCubit controller});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;

    return BlocBuilder<ParentCubit, ParentState>(
      builder: (context, state) {
        return BlocProvider.value(
          value: context.read<ProfileCubit>(),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final ProfileCubit controller = context.read<ProfileCubit>();
              return StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .doc(currentUser.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final userdata =
                        snapshot.data!.data() as Map<String, dynamic>;
                    final imageUrl = userdata['image'] ?? controller.imageUrl;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          ProfileImage(
                            imageUrl: imageUrl,
                            image: controller.image,
                            onImageSelected: (image) {
                              controller.updateImage(image);
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            currentUser.email!,
                            textAlign: TextAlign.center,
                            style: subTitle,
                          ),
                          const SizedBox(height: 10),
                          UserData(
                            text: userdata['username'],
                            sectionName: 'username'.translation,
                            changeName: () =>
                                controller.editField(context, "username"),
                          ),
                          UserData(
                            text: userdata['bio'],
                            sectionName: 'Bio'.translation,
                            changeName: () =>
                                controller.editField(context, "bio"),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
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
                                  'Language'.translation,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: SecondaryColor),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ParentCubit.instance.changeLanguage();
                                  },
                                  icon: const Icon(
                                    Icons.language,
                                    color: SecondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
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
                                  'Dark Mode'.translation,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: SecondaryColor),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ParentCubit.instance.changeMode();
                                  },
                                  icon: const Icon(
                                    Icons.mode_night_outlined,
                                    color: SecondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
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
                                  'Log out'.translation,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: SecondaryColor),
                                ),
                                IconButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.of(context)
                                        .pushReplacementNamed('login');
                                  },
                                  icon: const Icon(
                                    Icons.logout,
                                    color: SecondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error ${snapshot.error}'),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        );
      },
    );
  }
}
