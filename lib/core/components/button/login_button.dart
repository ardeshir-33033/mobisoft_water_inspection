import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final Function() onTap;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
