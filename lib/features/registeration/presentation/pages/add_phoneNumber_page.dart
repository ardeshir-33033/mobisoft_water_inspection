import 'package:flutter/material.dart';

class AddPhoneNumberPage extends StatelessWidget {
  AddPhoneNumberPage({Key? key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(
          controller: phoneNumberController,
          decoration: const InputDecoration(
            hoverColor: Colors.blue,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
          ),
          maxLines: null,
        ),
      ]),
    );
  }
}
