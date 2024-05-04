// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/controller/cubit/task_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/view/components/tasks_list.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/view/components/tasks_widget.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/controller/cubit/add_tasks_cubit.dart';
import 'package:flutter_project/theme.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<TaskCubit>(
        create: (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            final TaskCubit controller = context.read<TaskCubit>();
            return Scaffold(
              body: Column(
                children: [
                  TasksWidget(
                    controller: controller,
                  ),
                  BlocProvider(
                    create: (context) => AddTaskCubit(),
                    child: BlocBuilder<AddTaskCubit, AddTaskState>(
                      builder: (context, state) {
                        final AddTaskCubit addTaskController =
                            context.read<AddTaskCubit>();
                        return state is AddTaskLoading
                            ? const Center(child: CircularProgressIndicator())
                            : state is AddTaskEmpty
                                ? const Center(
                                    child: Icon(
                                    Icons.add_task_outlined,
                                    size: 100,
                                    color: SecondaryColor,
                                  ))
                                : Expanded(
                                    child: ListView.builder(
                                      itemBuilder: (_, int index) =>
                                          TasksListWidget(
                                        taskModel:
                                            addTaskController.tasks[index],
                                      ),
                                      itemCount: addTaskController.tasks.length,
                                    ),
                                  );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
