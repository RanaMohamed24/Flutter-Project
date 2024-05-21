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
          final CategoriesTasksCubit controller =
              context.read<CategoriesTasksCubit>();
          return GestureDetector(
            onTap: () {
              controller.toggleCheckbox(taskModel);
            },
            child: Container(
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
                  Text(
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
                ],
              ),
            ),
          );
        }));
  }
}
