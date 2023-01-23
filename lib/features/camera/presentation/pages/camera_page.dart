import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mobisoft_inspection/features/camera/presentation/widgets/camera_preview_widget.dart';

import '../widgets/camera_flash.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    Key? key,
    // required this.cameras
  }) : super(key: key);
  // final List<CameraDescription> cameras;
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;
  List<CameraDescription> cameras = <CameraDescription>[];

  @override
  void initState() {
    getCamera();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: controller != null && controller!.value.isRecordingVideo
                    ? Colors.redAccent
                    : Colors.grey,
                width: 3.0,
              ),
            ),
            child: CameraPreviewWidget(cameraController: controller),
          ),
          CameraFlash(
            controller: controller,
          )
        ],
      )),
    );
  }

  getCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller!.initialize().then((_) {
      controller?.setFlashMode(FlashMode.torch);

      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }
}
