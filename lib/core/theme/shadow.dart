import 'package:flutter/material.dart';

class FixedBoxShadow {
  fixedContainerShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 0,
      blurRadius: 10,
    );
  }
}
