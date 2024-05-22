// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/controller/cubit/task_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:flutter_project/core/utilities/theme.dart';

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
            margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
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
                Checkbox(
                  value: taskModel.isChecked,
                  onChanged: (newValue) {
                    controller.toggleCheckbox(taskModel);
                  },
                  shape: CircleBorder(),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => BorderSide(
                      width: 2.0,
                      color: PrimaryColor,
                    ),
                  ),
                  activeColor: PrimaryColor,
                  checkColor: Colors.white,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          taskModel.title,
                          style: TextStyle(
                            color: PrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            decoration: taskModel.isChecked
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                      ),
                      if (taskModel.note != null && taskModel.note!.isNotEmpty)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            taskModel.note!,
                            style: TextStyle(
                              color: SecondaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      Row(
                        children: [
                          if (taskModel.startTime != null &&
                              taskModel.startTime!.isNotEmpty)
                            Text(
                              taskModel.startTime!,
                              style: TextStyle(
                                color: SecondaryColor,
                                fontSize: 18,
                              ),
                            ),
                          if (taskModel.startTime != null &&
                              taskModel.startTime!.isNotEmpty &&
                              taskModel.endTime != null &&
                              taskModel.endTime!.isNotEmpty)
                            Text(
                              " - ",
                              style: TextStyle(
                                color: SecondaryColor,
                                fontSize: 18,
                              ),
                            ),
                          if (taskModel.endTime != null &&
                              taskModel.endTime!.isNotEmpty)
                            Text(
                              taskModel.endTime!,
                              style: TextStyle(
                                color: SecondaryColor,
                                fontSize: 18,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  color: PrimaryColor,
                  icon: Icon(Icons.edit_note_outlined),
                  onPressed: () {
                    // edit task
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Edit Task",
                            style: TextStyle(color: PrimaryColor),
                          ),
                          content: TextField(
                            controller: controller.taskController
                              ..text = taskModel.title,
                            decoration: InputDecoration(
                              hintText: "Enter new title",
                              hintStyle: TextStyle(color: SecondaryColor),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "cancel",
                                style: TextStyle(color: PrimaryColor),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (controller.taskController.text.isNotEmpty) {
                                  controller.updateTask(taskModel,
                                      controller.taskController.text);
                                  controller.taskController.clear();
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(color: PrimaryColor),
                              ),
                            ),
                          ],
                        );
                      },
                    );
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
