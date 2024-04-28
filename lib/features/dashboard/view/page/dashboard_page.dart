// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/controller/cubit/dashboard_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/users/view/user_page.dart';
import 'package:flutter_project/theme.dart';

class DashboardPage extends StatelessWidget {
  final List<String> titles = const ['Home', 'Users', 'home'];

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit controller = context.read<DashboardCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: PrimaryColor,
              title: Center(
                child: Text(
                  titles[controller.selectedTapIndex],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'registration');
                    },
                    icon: Icon(CupertinoIcons.add))
              ],
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTapIndex,
              children: const [
                Text('Home'),
                UserPage(),
                Text('Home'),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeTapIndex,
              unselectedItemColor: PrimaryColor,
              showUnselectedLabels: true,
              unselectedLabelStyle:
                  const TextStyle(fontSize: 15, color: PrimaryColor),
              selectedItemColor: FocusedColor,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Users"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
              ],
            ),
          );
        },
      ),
    );
  }
}
