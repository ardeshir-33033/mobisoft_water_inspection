import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              // availableCameras().then((value) => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => CameraPage(
              //               cameras: value,
              //             ))));
            },
            child: const Text("Home Page"))
      ],
    ));
  }
}
