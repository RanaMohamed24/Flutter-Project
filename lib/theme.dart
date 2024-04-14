// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

const PrimaryColor = Color.fromARGB(255, 17, 75, 142);
const SecondaryColor = Color.fromARGB(255, 47, 114, 190);
const TextFieldColor = Color(0xffffffff);
const FocusedColor = Color(0xff0e335c);
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
    color: PrimaryColor, fontSize: 24, fontWeight: FontWeight.w600);

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
