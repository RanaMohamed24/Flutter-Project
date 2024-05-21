part of 'registration_cubit.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}
final class RegistrationLoading extends RegistrationState {}
final class RegistrationLoaded extends RegistrationState {}
