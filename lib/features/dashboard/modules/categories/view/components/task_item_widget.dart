// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_state.dart';
import 'package:flutter_project/core/utilities/theme.dart';

class CategoryTaskItemWidget extends StatelessWidget {
  const CategoryTaskItemWidget({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoriesTasksCubit(),
        child: BlocBuilder<CategoriesTasksCubit, CategoriesTasksState>(
            builder: (context, state) {
          final CategoriesTasksCubit controller =
              context.read<CategoriesTasksCubit>();
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
                Checkbox(
                  value: taskModel.isChecked,
                  onChanged: (newValue) {
                    controller.toggleCheckbox(taskModel);
                  },
                  shape: const CircleBorder(),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
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
                            style: const TextStyle(
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
                              style: const TextStyle(
                                color: SecondaryColor,
                                fontSize: 18,
                              ),
                            ),
                          if (taskModel.startTime != null &&
                              taskModel.startTime!.isNotEmpty &&
                              taskModel.endTime != null &&
                              taskModel.endTime!.isNotEmpty)
                            const Text(
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
                              style: const TextStyle(
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
                  icon: const Icon(Icons.edit_note_outlined),
                  onPressed: () {
                    // edit task
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Edit Task",
                            style: TextStyle(color: PrimaryColor),
                          ),
                          content: TextField(
                            controller: controller.taskController
                              ..text = taskModel.title,
                            decoration: const InputDecoration(
                              hintText: "Enter new title",
                              hintStyle: TextStyle(color: SecondaryColor),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "cancel",
                                style: const TextStyle(color: PrimaryColor),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (controller.taskController.text.isNotEmpty) {
                                  controller.updateTask(
                                      taskModel,
                                      controller.taskController.text,
                                      taskModel.isChecked);
                                  controller.taskController.clear();
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text(
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
