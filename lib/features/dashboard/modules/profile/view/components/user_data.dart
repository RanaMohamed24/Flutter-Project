import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart';

class UserData extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? changeName;
  const UserData({
    super.key,
    required this.text,
    required this.sectionName,
    required this.changeName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: SecondaryColor,
            offset: Offset(0, 2),
            blurRadius: 5.0,
          ),
        ],
      ),
      width: 450,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: SecondaryColor,
                ),
              ),
              IconButton(
                  onPressed: changeName,
                  icon: const Icon(
                    Icons.edit,
                    color: SecondaryColor,
                  )),
            ],
          ),
          Text(text,
              style: const TextStyle(
                fontSize: 18.0,
                color: SecondaryColor,
              ))
        ],
      ),
    );
  }
}
