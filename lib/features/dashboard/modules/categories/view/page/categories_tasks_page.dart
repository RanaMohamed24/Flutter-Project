// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_state.dart';
import 'package:flutter_project/features/dashboard/modules/categories/view/components/categories_list_widget.dart';
import 'package:flutter_project/features/dashboard/modules/categories/view/components/tasks_list_widget.dart';

class CategoriesTasksPage extends StatelessWidget {
  const CategoriesTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<CategoriesTasksCubit>(
        create: (context) => CategoriesTasksCubit(),
        child: BlocBuilder<CategoriesTasksCubit, CategoriesTasksState>(
          builder: (context, state) {
            final CategoriesTasksCubit controller =
                context.read<CategoriesTasksCubit>();
            return Scaffold(
              body: Column(
                children: [
                  CategoriesListWidget(
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
