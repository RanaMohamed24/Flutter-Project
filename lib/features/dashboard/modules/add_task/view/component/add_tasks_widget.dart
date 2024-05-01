// ignore_for_file: unused_import, unnecessary_import, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/controller/cubit/add_tasks_cubit.dart';
import 'package:flutter_project/theme.dart';
import 'package:intl/intl.dart';

class AddTasksWidget extends StatelessWidget {
  const AddTasksWidget({super.key, required AddTaskCubit controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocBuilder<AddTaskCubit, AddTaskState>(
        builder: (context, state) {
          AddTaskCubit controller = context.read<AddTaskCubit>();
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: PrimaryColor,
              title: const Center(
                child: Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: Container(
              padding: DefaultPadding,
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title",
                            style: addTaskTitle,
                          ),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              decoration: AddTaskFieldDecoration.copyWith(
                                hintText: "Enter your title",
                              ),
                              controller: controller.titleController,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Note",
                              style: addTaskTitle,
                            ),
                            SizedBox(
                              height: 45,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // keyboardType: TextInputType.name,
                                obscureText: false,
                                decoration: AddTaskFieldDecoration.copyWith(
                                  hintText: "Enter your note",
                                ),
                                controller: controller.noteController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date",
                              style: addTaskTitle,
                            ),
                            SizedBox(
                              height: 45,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.name,
                                obscureText: false,
                                decoration: AddTaskFieldDecoration.copyWith(
                                  hintText: DateFormat.yMMMMd().format(
                                      controller.selectedDate ??
                                          DateTime.now()),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.getDateFromUser(context);
                                    },
                                    icon: const Icon(
                                      Icons.calendar_month_outlined,
                                      color: SecondaryColor,
                                    ),
                                  ),
                                ),
                                controller: controller.dateController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Start Time",
                                    style: addTaskTitle,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      // keyboardType: TextInputType.name,
                                      obscureText: false,
                                      decoration:
                                          AddTaskFieldDecoration.copyWith(
                                        hintText: DateFormat("hh:mm a").format(
                                            controller.selectedStartTime ??
                                                DateTime.now()),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            controller
                                                .getStartTimeFromUser(context);
                                          },
                                          icon: const Icon(
                                            Icons.access_time_rounded,
                                            color: SecondaryColor,
                                          ),
                                        ),
                                      ),
                                      controller:
                                          controller.startTimeController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "End Time",
                                    style: addTaskTitle,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      // keyboardType: TextInputType.name,
                                      obscureText: false,
                                      decoration:
                                          AddTaskFieldDecoration.copyWith(
                                        hintText: DateFormat("hh:mm a").format(
                                            DateTime.now()
                                                .add(const Duration(hours: 2))),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            controller
                                                .getEndTimeFromUser(context);
                                          },
                                          icon: const Icon(
                                            Icons.access_time_rounded,
                                            color: SecondaryColor,
                                          ),
                                        ),
                                      ),
                                      controller: controller.endTimeController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150.0,
                              height: 50.0,
                              child: FilledButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(PrimaryColor)),
                                onPressed: () {},
                                child: Text(
                                  'Create',
                                  style:
                                      textButton.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
