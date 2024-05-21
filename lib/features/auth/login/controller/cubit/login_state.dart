part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState{}
final class LoginLoaded extends LoginState {}
