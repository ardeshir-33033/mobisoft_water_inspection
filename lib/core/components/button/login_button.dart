import 'package:flutter/material.dart';
import 'package:mobisoft_inspection/core/theme/app_colors.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton(
      {Key? key, required this.title, required this.onTap, this.active = false})
      : super(key: key);

  final String title;
  final Function() onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: active ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: active
              ? AppColors.activeButtonColor
              : AppColors.inActiveButtonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
