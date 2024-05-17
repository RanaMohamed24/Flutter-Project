// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
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
          return Card.outlined(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: PrimaryColor),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 8, top: 7),
                      child: Text(
                        taskModel.title ?? 'xxx',
                        style: const TextStyle(
                            color: PrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        taskModel.note ?? 'xxx',
                        style: const TextStyle(
                          color: SecondaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        taskModel.date ?? 'xxx',
                        style: const TextStyle(
                            color: SecondaryColor, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 3),
                          child: Text(
                            taskModel.startTime ?? 'xxx',
                            style: const TextStyle(
                                color: SecondaryColor, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 3),
                          child: Text(
                            "-",
                            style: const TextStyle(
                                color: SecondaryColor, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 3),
                          child: Text(
                            taskModel.endTime ?? 'xxx',
                            style: const TextStyle(
                                color: SecondaryColor, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                // Container(
                // decoration: BoxDecoration(
                //   color: Colors.red,
                //   shape: BoxShape.circle,
                // ),
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
                // ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        }));
  }
}
