// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/view/components/cubit/cubit/dashboard_cubit.dart';
import 'package:flutter_project/theme.dart';

class DashboardPage extends StatelessWidget {
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
              backgroundColor: Colors.white,
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTapIndex,
              children: const [
                Text('Home'),
                Text('Home'),
                Text('Home'),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeTapIndex,
              unselectedItemColor: SecondaryColor,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(fontSize: 15, color: PrimaryColor),
              items: const[
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
              ],
            ),
            
          );
        },
      ),
    );
  }
}
