import 'package:flutter/material.dart';
import 'package:flutter_project/features/dashboard/modules/users/model/user_model.dart';
import 'package:flutter_project/theme.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: SecondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userModel.name ?? 'xxx',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w200, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 3),
            child: Text(
              userModel.address ?? 'xxx',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
