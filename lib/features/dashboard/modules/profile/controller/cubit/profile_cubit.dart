import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart';
import 'package:meta/meta.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
 ProfileCubit() : super(ProfileInitial());
}
