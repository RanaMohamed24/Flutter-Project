// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const PrimaryColor = Color.fromARGB(255, 1, 69, 72);
const SecondaryColor = Color.fromARGB(255, 79, 128, 125);
const TextFieldColor = Color(0xFF979797);
const FocusedColor = Color(0xFF14292B);
const ErrorColor = Color(0xFFFF1E1E);

const DefaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 30);
const DefaultVerticallPadding = EdgeInsets.symmetric(vertical: 5);
const DefaultPadding = EdgeInsets.all(10);

TextStyle titleText = const TextStyle(
    color: PrimaryColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subTitle = const TextStyle(
    color: SecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle textButton = const TextStyle(
  color: PrimaryColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);