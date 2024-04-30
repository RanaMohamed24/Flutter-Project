import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardChangeState());

  int selectedTapIndex = 0;
  final PageController pageController = PageController();
  void onChangeTapIndex(int index) {
    selectedTapIndex = index;
    pageController.jumpToPage(selectedTapIndex);
    emit(DashboardChangeState());
  }
}
