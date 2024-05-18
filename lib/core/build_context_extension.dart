import 'package:flutter_project/core/cubit/parent_cubit.dart';

extension MyLocalization on String {
  String get translation => ParentCubit.instance.local[this] ?? toUpperCase();
}
