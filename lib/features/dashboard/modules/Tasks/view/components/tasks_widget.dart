// ignore_for_file: avoid_unnecessary_containers

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/controller/cubit/task_cubit.dart';
import 'package:flutter_project/theme.dart';
import 'package:intl/intl.dart';

class TasksWidget extends StatelessWidget {
  final TaskCubit controller;

  const TasksWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: DefaultPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.yMMMMd().format(DateTime.now()),
                            style: subTitle,
                          ),
                          Text(
                            "Today",
                            style: titleText,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: DefaultPadding,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: FilledButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(PrimaryColor)),
                          onPressed: () => controller.onPressedButton(context),
                          child: Center(
                            child: Text(
                              "+ Add Task",
                              style: textButton.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: DatePicker(
                    DateTime.now(),
                    height: 100,
                    width: 80,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: PrimaryColor,
                    selectedTextColor: Colors.white,
                    dateTextStyle: subTitle,
                    monthTextStyle:
                        const TextStyle(color: SecondaryColor, fontSize: 14),
                    dayTextStyle:
                        const TextStyle(color: SecondaryColor, fontSize: 14),
                    onDateChange: (date) {
                      controller.selectedDate = date;
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
