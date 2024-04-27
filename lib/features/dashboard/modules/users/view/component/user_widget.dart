import 'package:flutter/material.dart';
import 'package:flutter_project/features/dashboard/modules/users/model/user_model.dart';
import 'package:flutter_project/theme.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: TextFieldColor,
      child: Column(
        children: [
          Text(
            userModel.name ?? 'xxx',
            style: titleText,
          ),
          Text(
            userModel.address ?? 'xxx',
            style: subTitle,
          ),
        ],
      ),
    );
  }
}
