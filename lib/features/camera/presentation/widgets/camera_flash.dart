import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraFlash extends StatefulWidget {
  const CameraFlash({Key? key, required this.controller}) : super(key: key);

  final CameraController? controller;

  @override
  State<CameraFlash> createState() => _CameraFlashState();
}

class _CameraFlashState extends State<CameraFlash> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.flash_off),
          color: widget.controller?.value.flashMode == FlashMode.off
              ? Colors.orange
              : Colors.blue,
          onPressed: widget.controller != null
              ? () => onSetFlashModeButtonPressed(FlashMode.off)
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.flash_auto),
          color: widget.controller?.value.flashMode == FlashMode.auto
              ? Colors.orange
              : Colors.blue,
          onPressed: widget.controller != null
              ? () => onSetFlashModeButtonPressed(FlashMode.auto)
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.flash_on),
          color: widget.controller?.value.flashMode == FlashMode.always
              ? Colors.orange
              : Colors.blue,
          onPressed: widget.controller != null
              ? () => onSetFlashModeButtonPressed(FlashMode.always)
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.highlight),
          color: widget.controller?.value.flashMode == FlashMode.torch
              ? Colors.orange
              : Colors.blue,
          onPressed: widget.controller != null
              ? () => onSetFlashModeButtonPressed(FlashMode.torch)
              : null,
        ),
      ],
    );
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      ('Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (widget.controller == null) {
      return;
    }

    try {
      await widget.controller!.setFlashMode(mode);
    } on CameraException {
      rethrow;
    }
  }
}
