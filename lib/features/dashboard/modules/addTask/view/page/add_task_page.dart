// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/addTask/controller/cubit/add_task_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/addTask/view/component/add_task_widget.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocBuilder<AddTaskCubit, AddTaskState>(
        builder: (context, state) {
          AddTaskCubit controller = context.read<AddTaskCubit>();
          return Scaffold(
            body: AddTaskWidget(
              controller: controller,
            ),
          );
        },
      ),
    );
  }
}
