// profile_state.dart
part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileImageChanged extends ProfileState {
  final Uint8List? image;
  final String? imageUrl;

  ProfileImageChanged({this.image, this.imageUrl});
}

class ProfileFieldUpdated extends ProfileState {}