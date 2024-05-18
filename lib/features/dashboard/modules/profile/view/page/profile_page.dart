import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/profile/controller/cubit/profile_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/profile/view/components/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final ProfileCubit cotroller = context.read<ProfileCubit>();
          return Scaffold(
            body: Column(
              children: [
                ProfileWidget(
                  controller: cotroller)
              ]
                    
             ),
          );
        },
      ),
    ));
  }
}
