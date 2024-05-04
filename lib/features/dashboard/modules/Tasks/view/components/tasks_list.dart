import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/model/task_model.dart';
import 'package:flutter_project/theme.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DefaultPadding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: PrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title ?? 'title',
                    style: titleText.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      taskModel.note ?? 'note',
                      style: subTitle.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () async {
                    log("delete");
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: SecondaryColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
