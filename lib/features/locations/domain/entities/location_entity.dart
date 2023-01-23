import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class LocationEntity extends Equatable {
  int? id;
  double? lat;
  double? lng;
  double? distance;
  String? title;
  String? address;

  LocationEntity(
      {this.id, this.title, this.address, this.lat, this.lng, this.distance});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        address,
      ];
}
