import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/controller/cubit/task_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/view/components/task_item_widget.dart';

class TasksStateWidget extends StatelessWidget {
  const TasksStateWidget({super.key, required this.controller});
  final TaskCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          final TaskCubit controller = context.read<TaskCubit>();
          return state is TaskLoading
              ? const Center(child: CircularProgressIndicator())
              : state is TaskEmpty
                  ? const Center(
                      child: Icon(
                      CupertinoIcons.calendar_circle,
                      size: 100,
                      color: Colors.grey,
                    ))
                  : ListView.builder(
                      itemCount: controller.tasks.length,
                      itemBuilder: (_, int index) {
                        return TaskItemWidget(
                            taskModel: controller.tasks[index]);
                      },
                    );
        },
      ),
    );
  }
}
