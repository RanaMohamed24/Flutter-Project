// ignore_for_file: unnecessary_import, implementation_imports, prefer_final_fields, unused_field

import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  DateTime selectedDate = DateTime.now();
  onPressedButton(BuildContext context) {}
}
