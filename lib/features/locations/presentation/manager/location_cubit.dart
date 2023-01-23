import 'dart:math';

import 'package:api_handler/api_handler.dart';
import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:mobisoft_inspection/features/locations/domain/entities/location_entity.dart';
import 'package:mobisoft_inspection/features/locations/domain/use_cases/get_all_locations_usecase.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetAllLocationsUseCase _getAllLocationsUseCase;

  LocationCubit(this._getAllLocationsUseCase) : super(LocationInitial()) {
    getCurrentLocation();
  }

  final Location _location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? locationData;

  List<LocationEntity> locations = [];

  // distance between two points in kilometer
  double computeDistance(double lat1, double lon1) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((locationData!.latitude! - lat1) * p) / 2 +
        c(lat1 * p) *
            c(locationData!.latitude! * p) *
            (1 - c((locationData!.longitude! - lon1) * p)) /
            2;

    return 12742 * asin(sqrt(a));
  }

  getCurrentLocation() async {
    emit(LocationPending());

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await _location.getLocation();
    emit(LocationSuccess());
  }

  getAllLocations() async {
    emit(LocationPending());

    try {
      ResponseModel response = await _getAllLocationsUseCase(null);

      if (response.result == ResultEnum.SUCCESS) {
        locations = response.data;

        if (locationData != null) {
          sortLocations();
        }

        emit(LocationSuccess());
      } else {
        emit(LocationError(response.message?.first));
      }
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  sortLocations() {
    for (LocationEntity element in locations) {
      if (element.lat != null && element.lng != null) {
        double distance = computeDistance(element.lat!, element.lng!);
        element.distance = distance;
      }
    }

    locations.sort((a, b) {
      double? d1 = a.distance;
      double? d2 = b.distance;
      if (d1 != null && d2 != null) {
        if (d1 > d2) {
          return 1;
        } else if (d1 < d2) {
          return -1;
        } else {
          return 0;
        }
      } else {
        return -1;
      }
    });
  }

  emitLoading() {
    emit(LocationPending());
  }

  emitSuccess() {
    emit(LocationSuccess());
  }
}
