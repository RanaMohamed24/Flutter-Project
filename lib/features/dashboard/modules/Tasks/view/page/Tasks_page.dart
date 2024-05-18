// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/controller/cubit/task_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/view/components/task_list_widgets.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/view/components/tasks_widget.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<TaskCubit>(
        create: (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            final TaskCubit controller =
                context.read<TaskCubit>();
            return Scaffold(
              body: Column(
                children: [
                  TasksWidget(
                    controller: controller,
                  ),
                  Expanded(
                    child: TasksListWidget(
                      controller: controller,
                    )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}