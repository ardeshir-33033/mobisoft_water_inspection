// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapWidget extends StatelessWidget {
//   const MapWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final Completer<GoogleMapController> _controller =
//         Completer<GoogleMapController>();
//
//     const CameraPosition _kGooglePlex = CameraPosition(
//       target: LatLng(37.42796133580664, -122.085749655962),
//       zoom: 14.4746,
//     );
//
//     const CameraPosition _kLake = CameraPosition(
//         bearing: 192.8334901395799,
//         target: LatLng(37.43296265331129, -122.08832357078792),
//         tilt: 59.440717697143555,
//         zoom: 19.151926040649414);
//     return SizedBox(
//       height: 200,
//       width: 200,
//       child: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//     );
//   }
// }
