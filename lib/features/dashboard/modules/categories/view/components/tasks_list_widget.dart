import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_state.dart';
import 'package:flutter_project/features/dashboard/modules/categories/view/components/task_item_widget.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({super.key, required this.controller});
  final CategoriesTasksCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesTasksCubit, CategoriesTasksState>(
      builder: (context, state) {
        if (state is TasksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TasksEmpty) {
          return const Center(
            child: Icon(
              CupertinoIcons.delete,
              size: 100,
              color: Colors.grey,
            ),
          );
        } else if (state is TasksLoaded) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (_, int index) {
              return CategoryTaskItemWidget(taskModel: state.tasks[index]);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
