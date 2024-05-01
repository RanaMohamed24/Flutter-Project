import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/users/controller/cubit/user_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/users/view/component/user_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final UserCubit controller = context.read<UserCubit>();
          return Scaffold(
            body: state is UserLoading
                ? const Center(child: CircularProgressIndicator())
                : state is UserEmpty
                    ? const Center(
                        child: Icon(
                        CupertinoIcons.delete,
                        size: 100,
                        color: Colors.grey,
                      ))
                    : ListView.separated(
                        separatorBuilder: (_, int index) => const Divider(
                              height: 2,
                              thickness: 4,
                            ),
                        itemCount: controller.users.length,
                        itemBuilder: (_, int index) {
                          return UserItemWidget(
                              userModel: controller.users[index]);
                        }),
          );
        },
      ),
    );
  }
}
