import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/build_context_extension.dart';
import 'package:flutter_project/features/dashboard/modules/manage_categories/controller/cubit/manage_categories_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/manage_categories/controller/cubit/manage_categories_state.dart';
import 'package:flutter_project/theme.dart';

class ManageCategoriesPage extends StatelessWidget {
  const ManageCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ManageCategoriesCubit>(
        create: (context) => ManageCategoriesCubit(),
        child: BlocBuilder<ManageCategoriesCubit, ManageCategoriesState>(
          builder: (context, state) {
            final ManageCategoriesCubit controller =
                context.read<ManageCategoriesCubit>();

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: PrimaryColor,
                title: Center(
                  child: Text(
                    'Manage Categories'.translation,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    if (state is ManageCategoriesLoading)
                      const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: PrimaryColor,
                          ),
                        ),
                      )
                    else if (state is ManageCategoriesEmpty)
                      const Expanded(
                        child: Center(
                          child: Icon(
                            CupertinoIcons.delete,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    else if (state is ManageCategoriesLoaded)
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            return ListTile(
                              title: Text(
                                category.name,
                                style: const TextStyle(color: SecondaryColor),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Edit Category'.translation,
                                              style: const TextStyle(
                                                  color: PrimaryColor),
                                            ),
                                            content: TextField(
                                              controller:
                                                  controller.categoryController
                                                    ..text = category.name,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter new category name'
                                                        .translation,
                                                hintStyle: const TextStyle(
                                                    color: SecondaryColor),
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Cancel'.translation,
                                                  style: const TextStyle(
                                                      color: PrimaryColor),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  if (controller
                                                      .categoryController
                                                      .text
                                                      .isNotEmpty) {
                                                    controller.updateCategory(
                                                        category,
                                                        controller
                                                            .categoryController
                                                            .text);
                                                    controller
                                                        .categoryController
                                                        .clear();
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                                child: Text(
                                                  'Save'.translation,
                                                  style: const TextStyle(
                                                      color: PrimaryColor),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: SecondaryColor,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Delete Category'.translation,
                                              style: const TextStyle(
                                                  color: PrimaryColor),
                                            ),
                                            content: Text(
                                                'Are you sure you want to delete "${category.name}"?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Cancel'.translation,
                                                  style: const TextStyle(
                                                      color: PrimaryColor),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  controller
                                                      .deleteCategory(category);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Delete'.translation,
                                                  style: const TextStyle(
                                                      color: PrimaryColor),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: SecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Add New Category'.translation,
                          style: const TextStyle(color: PrimaryColor),
                        ),
                        content: TextField(
                          controller: controller.categoryController,
                          decoration: InputDecoration(
                            hintText: 'Enter category name'.translation,
                            hintStyle: const TextStyle(color: SecondaryColor),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancel'.translation,
                              style: const TextStyle(color: PrimaryColor),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (controller.categoryController.text.isNotEmpty) {
                                controller
                                    .addCategory(controller.categoryController.text)
                                    .then((_) {
                                  Navigator.of(context).pop();
                                });
                              }
                            },
                            child: Text(
                              'Add'.translation,
                              style: const TextStyle(color: PrimaryColor),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                backgroundColor: PrimaryColor,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
