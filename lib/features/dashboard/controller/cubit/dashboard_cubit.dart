import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
// import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardChangeState());

  int selectedTapIndex = 0;
  final PageController pageController = PageController();
  void onChangeTapIndex(int index) {
    if (index == 2) {
      throw 'dummy execption frpm mobile';
    }
    selectedTapIndex = index;
    pageController.jumpToPage(selectedTapIndex);
    emit(DashboardChangeState());
  }
}
