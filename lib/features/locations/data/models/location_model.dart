import '../../domain/entities/location_entity.dart';

//ignore: must_be_immutable
class LocationModel extends LocationEntity {
  LocationModel({
    int? id,
    double? lat,
    double? lng,
    double? distance,
    String? title,
    String? address,
  }) : super(
          id: id,
          title: title,
          address: address,
        );

  LocationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    title = json['title'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['address'] = address;

    return data;
  }

  List<LocationModel> listFromJson(dynamic json) {
    List<LocationModel> locations = <LocationModel>[];
    json['locations'].forEach((v) {
      locations.add(LocationModel.fromJson(v));
    });
    return locations;

    // if (json != null) {
    //   return json.map<LocationModel>((j) {
    //     return LocationModel.fromJson(j);
    //   }).toList();
    // }
    // return [];
  }
}
