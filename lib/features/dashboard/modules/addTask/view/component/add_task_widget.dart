import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/dashboard/modules/addTask/controller/cubit/add_task_cubit.dart';
import 'package:flutter_project/theme.dart';
import 'package:intl/intl.dart';

class AddTaskWidget extends StatelessWidget {
  final AddTaskCubit controller;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  AddTaskWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        if (state is AddTaskDateChanged) {
          dateController.text = DateFormat.yMd().format(state.selectedDate);
        }

        if (state is AddTaskStartTimeChanged) {
          startTimeController.text =
              DateFormat.jm().format(state.selectedStartTime);
        }

        if (state is AddTaskEndTimeChanged) {
          endTimeController.text =
              DateFormat.jm().format(state.selectedEndTime);
        }

        return Scaffold(
          appBar: AppBar(
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
            // leading: IconButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, 'dashboard');
            //   },
            //   icon: const Icon(Icons.arrow_back_ios_new_rounded),
            // ),
          ),
          body: Container(
            padding: DefaultPadding,
            child: SingleChildScrollView(
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          decoration: AddTaskFieldDecoration.copyWith(
                            hintText: "Enter your title",
                          ),
                          controller: titleController,
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
                            keyboardType: TextInputType.name,
                            obscureText: false,
                            decoration: AddTaskFieldDecoration.copyWith(
                              hintText: "Enter your note",
                            ),
                            controller: noteController,
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
                              hintText: DateFormat.yMd().format(DateTime.now()),
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
                            controller: dateController,
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
                                  keyboardType: TextInputType.name,
                                  obscureText: false,
                                  decoration: AddTaskFieldDecoration.copyWith(
                                    hintText:
                                        DateFormat.jm().format(DateTime.now()),
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
                                  controller: startTimeController,
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
                                  keyboardType: TextInputType.name,
                                  obscureText: false,
                                  decoration: AddTaskFieldDecoration.copyWith(
                                    hintText: DateFormat.jm().format(
                                        DateTime.now()
                                            .add(const Duration(hours: 2))),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.getEndTimeFromUser(context);
                                      },
                                      icon: const Icon(
                                        Icons.access_time_rounded,
                                        color: SecondaryColor,
                                      ),
                                    ),
                                  ),
                                  controller: endTimeController,
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
                              style: textButton.copyWith(color: Colors.white),
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
        );
      },
    );
  }
}
