import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/build_context_extension.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/categories/controller/cubit/categories_tasks_state.dart';
import 'package:flutter_project/core/utilities/theme.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key, required this.controller});
  final CategoriesTasksCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<CategoriesTasksCubit, CategoriesTasksState>(
          builder: (context, state) {
        return state is CategoriesLoading
            ? const Column(
                children: [
                  SizedBox(height: 10),
                  Center(child: CircularProgressIndicator()),
                ],
              )
            : state is CategoriesEmpty
                ? const Column(
                    children: [
                      Center(
                          child: Icon(
                        CupertinoIcons.calendar_circle,
                        size: 100,
                        color: Colors.grey,
                      )),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.selectCategory(
                                        controller.categories[index].name);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: controller.selectedCategory ==
                                              controller.categories[index].name
                                          ? PrimaryColor
                                          : const Color.fromARGB(
                                              255, 104, 151, 228),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      controller.categories[index].name == "All"
                                          ? controller.categories[index].name
                                              .translation
                                          : controller.categories[index].name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        PopupMenuButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: PrimaryColor,
                            size: 30,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'manage_categories',
                              child: Text(
                                'Manage Categories'.translation,
                                style: const TextStyle(color: PrimaryColor),
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, 'manageCategories');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
      }),
    );
  }
}
