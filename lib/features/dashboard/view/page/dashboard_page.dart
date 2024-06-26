// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/build_context_extension.dart';
import 'package:flutter_project/features/dashboard/controller/cubit/dashboard_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/view/page/Tasks_page.dart';
import 'package:flutter_project/features/dashboard/modules/categories/view/page/categories_tasks_page.dart';
import 'package:flutter_project/features/dashboard/modules/profile/view/page/profile_page.dart';
import 'package:flutter_project/core/utilities/theme.dart';

class DashboardPage extends StatelessWidget {
  final List<String> titles = const ['Tasks', 'Categories', 'Profile'];
  final user = FirebaseAuth.instance.currentUser;
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit controller = context.read<DashboardCubit>();
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: PrimaryColor,
              title: Center(
                child: Text(
                  titles[controller.selectedTapIndex].translation,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTapIndex,
              children: const [
                TasksPage(),
                CategoriesTasksPage(),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeTapIndex,
              selectedItemColor: PrimaryColor,
              unselectedItemColor: SecondaryColor,
              showUnselectedLabels: true,
              unselectedLabelStyle:
                  const TextStyle(fontSize: 15, color: SecondaryColor),
              selectedLabelStyle:
                  const TextStyle(fontSize: 15, color: PrimaryColor),
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.task_alt_rounded),
                    label: "Tasks".translation),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.category_rounded),
                    label: "Categories".translation),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.person),
                    label: "Profile".translation),
              ],
            ),
          );
        },
      ),
    );
  }
}
