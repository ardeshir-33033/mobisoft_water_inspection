import 'package:mobisoft_inspection/features/locations/domain/entities/location_entity.dart';

class Locations {
  static late LocationEntity _location;

  setLocation(LocationEntity location) {
    _location = location;
  }

  getLocation() {
    return _location;
  }
}
