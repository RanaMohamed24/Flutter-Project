part of 'parent_cubit.dart';

@immutable
sealed class ParentState {}

final class ParentInitial extends ParentState {}

class LanguageChanged extends ParentState {
  final String lang;

  LanguageChanged(this.lang);
}

class ThemeModeChanged extends ParentState {
  final ThemeMode themeMode;

  ThemeModeChanged(this.themeMode);
}
