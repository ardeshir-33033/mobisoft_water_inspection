import 'package:flutter/material.dart';

class ApproachWidget extends StatelessWidget {
  const ApproachWidget(
      {Key? key, required this.childWidget, this.chosen = false})
      : super(key: key);

  final Widget childWidget;
  final bool chosen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: chosen ? Colors.red : Colors.black),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 0.0, spreadRadius: 3),
          ]),
      child: childWidget,
    );
  }
}
