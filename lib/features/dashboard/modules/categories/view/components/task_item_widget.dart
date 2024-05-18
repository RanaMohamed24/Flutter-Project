import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_state.dart';
import 'package:flutter_project/theme.dart';

class CategoryTaskItemWidget extends StatelessWidget {
  const CategoryTaskItemWidget({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoriesTasksCubit(),
        child: BlocBuilder<CategoriesTasksCubit, CategoriesTasksState>(
            builder: (context, state) {
          final CategoriesTasksCubit controller = context.read<CategoriesTasksCubit>();
          return Card.outlined(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: PrimaryColor),
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
                        taskModel.title,
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
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        taskModel.date,
                        style: const TextStyle(
                            color: SecondaryColor, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
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
                        const SizedBox(
                          width: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 3),
                          child: Text(
                            "-",
                            style:
                                TextStyle(color: SecondaryColor, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
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
                const Spacer(),
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
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        }));
  }
}
