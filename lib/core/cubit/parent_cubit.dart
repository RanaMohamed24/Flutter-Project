import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  static final ParentCubit instance = ParentCubit();
  ThemeMode themeMode = ThemeMode.light;
  ParentCubit() : super(ParentInitial()) {
    loadLanguage();
  }

  Map<String, dynamic> local = {};

  String lang = 'en';

  Future<void> loadLanguage() async {
    String arabic = await rootBundle.loadString('assets/lang/$lang.json');
    local = json.decode(arabic);
    emit(ParentInitial());
  }

  void changeLanguage() {
    lang = lang == 'en' ? 'ar' : 'en';
    loadLanguage();
    emit(LanguageChanged(lang));
  }

  void changeMode() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeModeChanged(themeMode));
  }
}
