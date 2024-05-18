// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/controller/cubit/add_tasks_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/controller/cubit/add_tasks_state.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/view/component/add_tasks_widget.dart';

class AddTasksPage extends StatelessWidget {
  const AddTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocBuilder<AddTaskCubit, AddTaskState>(
        builder: (context, state) {
          AddTaskCubit controller = context.read<AddTaskCubit>();
          return Scaffold(
            body: AddTasksWidget(
              controller: controller,
            ),
          );
        },
      ),
    );
  }
}
