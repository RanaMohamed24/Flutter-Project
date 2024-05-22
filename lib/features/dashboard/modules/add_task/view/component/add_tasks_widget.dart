// ignore_for_file: unused_import, unnecessary_import, unused_local_variable, must_be_immutable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/build_context_extension.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/controller/cubit/add_tasks_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/controller/cubit/add_tasks_state.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/category_model.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/repo/firestore.dart';
import 'package:flutter_project/core/utilities/theme.dart';
import 'package:intl/intl.dart';

class AddTasksWidget extends StatelessWidget {
  AddTasksWidget({super.key, required AddTaskCubit controller});
  CollectionReference Tasks = FirebaseFirestore.instance.collection('Tasks');

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
              title: Center(
                child: Text(
                  "Add Task".translation,
                  style: const TextStyle(
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
                            "Title".translation,
                            style: addTaskTitle,
                          ),
                          SizedBox(
                            height: 70,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              decoration: AddTaskFieldDecoration.copyWith(
                                hintText: "Enter your title".translation,
                              ),
                              controller: controller.titleController,
                              style: const TextStyle(color: SecondaryColor),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'required field'.translation;
                                }
                                return null;
                              },
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
                              "Note".translation,
                              style: addTaskTitle,
                            ),
                            SizedBox(
                              height: 70,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: false,
                                decoration: AddTaskFieldDecoration.copyWith(
                                  hintText: "Enter your note".translation,
                                ),
                                controller: controller.noteController,
                                style: const TextStyle(color: SecondaryColor),
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
                              "Date".translation,
                              style: addTaskTitle,
                            ),
                            SizedBox(
                              height: 70,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: false,
                                style: const TextStyle(color: SecondaryColor),
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'required field'.translation;
                                  }
                                  return null;
                                },
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
                                    "Start Time".translation,
                                    style: addTaskTitle,
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(
                                          color: SecondaryColor),
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
                                    "End Time".translation,
                                    style: addTaskTitle,
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      obscureText: false,
                                      style: const TextStyle(
                                          color: SecondaryColor),
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
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Category".translation,
                              style: addTaskTitle,
                            ),
                            SizedBox(
                              height: 50,
                              child: DropdownButtonFormField<CategoryModel>(
                                value: controller.selectedCategory,
                                items: controller.categories
                                    .map((category) => DropdownMenuItem(
                                          value: category,
                                          child: Text(category.name),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  controller.setCategory(value!);
                                },
                                decoration: AddTaskFieldDecoration.copyWith(
                                  hintText: controller.selectedCategory?.name ??
                                      "Select a category".translation,
                                ),
                                style: const TextStyle(color: SecondaryColor),
                                menuMaxHeight: 150,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: state is AddTaskloading
                              ? const Center(child: CircularProgressIndicator())
                              : FilledButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          PrimaryColor)),
                                  onPressed: () {
                                    controller.addTask(context);
                                  },
                                  child: Text(
                                    'Create'.translation,
                                    style: textButton.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
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
