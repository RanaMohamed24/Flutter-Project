import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/build_context_extension.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_state.dart';

class AddCategoryWidget extends StatelessWidget {
  const AddCategoryWidget({super.key, required this.controller});
  final CategoriesTasksCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesTasksCubit>(
        create: (context) => CategoriesTasksCubit(),
        child: BlocBuilder<CategoriesTasksCubit, CategoriesTasksState>(
            builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.categoryController,
                    decoration: InputDecoration(
                      hintText: 'Enter new category'.translation,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (controller.categoryController.text.isNotEmpty) {
                      controller
                          .addCategory(controller.categoryController.text);
                    }
                  },
                  child: Text('Add'.translation),
                ),
              ],
            ),
          );
        }));
  }
}
