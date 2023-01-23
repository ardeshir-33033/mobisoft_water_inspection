import 'dart:convert';

import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:api_handler/api_handler.dart';
import 'package:api_handler/feature/api_handler/presentation/presentation_usecase.dart';

import '../models/location_model.dart';

abstract class LocationsDataSource {
  Future<ResponseModel> getAllLocations();
}

class LocationsDataSourceImpl extends LocationsDataSource {
  LocationsDataSourceImpl(this.api);
  final APIHandler api;

  @override
  Future<ResponseModel> getAllLocations() {
    // ResponseModel response = await api.get(
    //   LocationRoute.locations,
    //   headerEnum: HeaderEnum.bearerHeaderEnum,
    //   responseEnum: ResponseEnum.responseModelEnum,
    // );
    // if (response.result == ResultEnum.SUCCESS) {
    ResponseModel response =
        ResponseModel(statusCode: 200, result: ResultEnum.SUCCESS, data: """{
    "locations": [
        {
            "id": 1,
            "title": "Address 1",
            "address": "Laudongasse 13, 1080 Wien, Austria",
            "lat": 35.684299,
            "lng": 51.468595
        },
        {
            "id": 2,
            "title": "Address 2",
            "address": "Yppenmarkt, 1160 Wien, Austria",
            "lat": 35.588816,
            "lng": 51.478705
        },
        {
            "id": 3,
            "title": "Address 3",
            "address": "Akkonpl. 3, 1150 Wien, Austria",
            "lat": 35.749205,
            "lng": 51.469081
        },
        {
            "id": 4,
            "title": "Address 4",
            "address": "Märzstraße 87, 1150 Wien, Austria",
            "lat": 35.739692,
            "lng": 51.474132
        }
    ]
}
    """);
    response.data = LocationModel().listFromJson(jsonDecode(response.data));

    return Future.value(response);
  }
}
