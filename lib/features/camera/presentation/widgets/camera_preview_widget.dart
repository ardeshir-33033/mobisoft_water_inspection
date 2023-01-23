import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewWidget extends StatelessWidget {
  const CameraPreviewWidget({Key? key, this.cameraController})
      : super(key: key);

  final CameraController? cameraController;

  @override
  Widget build(BuildContext context) {
    if (cameraController == null ||
        (!(cameraController?.value.isInitialized ?? true))) {
      return const Center(
        child: Text(
          'Tap a camera',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else {
      return CameraPreview(
        cameraController!,
        // child: LayoutBuilder(
        //     builder: (BuildContext context, BoxConstraints constraints) {
        //   return GestureDetector(
        //     behavior: HitTestBehavior.opaque,
        //     onScaleStart: _handleScaleStart,
        //     onScaleUpdate: _handleScaleUpdate,
        //     onTapDown: (TapDownDetails details) =>
        //         onViewFinderTap(details, constraints),
        //   );
        // }),
      );
    }
  }
}
