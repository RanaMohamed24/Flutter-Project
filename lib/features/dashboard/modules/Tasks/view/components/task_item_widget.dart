// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/controller/cubit/task_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:flutter_project/theme.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
          final TaskCubit controller = context.read<TaskCubit>();
          return Container(
            margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
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
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 8, top: 7, bottom: 7),
                      child: Text(
                        taskModel.title,
                        style: const TextStyle(
                            color: PrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  color: PrimaryColor,
                  icon: const Icon(Icons.edit_note_outlined),
                  onPressed: () {
                    // edit task
                  },
                ),
                IconButton(
                  color: PrimaryColor,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    controller.delete(context, taskModel.docId ?? " ");
                  },
                ),
              ],
            ),
          );
        }));
  }
}
