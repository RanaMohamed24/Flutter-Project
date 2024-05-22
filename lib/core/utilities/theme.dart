// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class MyTheme {
  static final MyTheme instance = MyTheme();

  ThemeData light = ThemeData.light(useMaterial3: true);
  ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Color(0xFF393840),
  );
}

const PrimaryColor = Color.fromARGB(255, 75, 116, 187);
const SecondaryColor = Color.fromARGB(255, 100, 140, 206);
const TextFieldColor = Color(0xffffffff);
const FocusedColor = Color.fromARGB(255, 72, 108, 165);
const ErrorColor = Color(0xFFFF1E1E);

const DefaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 30);
const DefaultVerticallPadding = EdgeInsets.symmetric(vertical: 5);
const DefaultPadding = EdgeInsets.all(15);

TextStyle titleText = const TextStyle(
    color: PrimaryColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subTitle = const TextStyle(
    color: SecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle textButton = const TextStyle(
  color: PrimaryColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
TextStyle onboardingTitle = const TextStyle(
    color: PrimaryColor, fontSize: 24, fontWeight: FontWeight.bold);

TextStyle onboardingSubTitle = const TextStyle(
    color: SecondaryColor, fontSize: 14, fontWeight: FontWeight.w500);

TextStyle addTaskTitle = const TextStyle(
    color: PrimaryColor, fontSize: 20, fontWeight: FontWeight.w500);

InputDecoration TextFieldDecoration = InputDecoration(
  hintText: "hint",
  hintStyle: const TextStyle(color: SecondaryColor),
  prefixIcon: const Icon(Icons.account_circle),
  border: UnderlineInputBorder(
      borderSide: const BorderSide(color: SecondaryColor),
      borderRadius: BorderRadius.circular(0)),
  focusedBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: PrimaryColor, width: 2.5),
      borderRadius: BorderRadius.circular(10)),
  errorBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: ErrorColor, width: 2),
      borderRadius: BorderRadius.circular(0)),
);

InputDecoration OtpTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: SecondaryColor),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: PrimaryColor, width: 2.5),
      borderRadius: BorderRadius.circular(20)),
);

InputDecoration AddTaskFieldDecoration = InputDecoration(
  hintText: "hint",
  hintStyle: const TextStyle(color: SecondaryColor),
  border: OutlineInputBorder(
      borderSide: const BorderSide(color: SecondaryColor),
      borderRadius: BorderRadius.circular(12)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: PrimaryColor, width: 1.5),
      borderRadius: BorderRadius.circular(12)),
  errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: ErrorColor, width: 1.5),
      borderRadius: BorderRadius.circular(12)),
  contentPadding: const EdgeInsets.only(left: 14, top: 12, bottom: 12),
);

extension MyContextExtenction on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
