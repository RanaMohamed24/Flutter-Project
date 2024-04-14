// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("home", style: titleText,)),
    );
  }
}
