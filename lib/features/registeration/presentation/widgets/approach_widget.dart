import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ApproachWidget extends StatelessWidget {
  const ApproachWidget(
      {Key? key, required this.icon, required this.title, this.chosen = false})
      : super(key: key);

  final IconData icon;
  final String title;
  final bool chosen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(chosen ? 0.5  : 0.2),
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ]),
      child: Column(
        children: [
          Icon(
            icon,
            color: chosen ? Colors.red : Colors.grey,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            title,
            style: TextStyle(color: chosen ? Colors.red : Colors.grey),
          )
        ],
      ),
    );
  }
}

// camera widget
