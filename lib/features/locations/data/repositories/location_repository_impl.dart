import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:mobisoft_inspection/features/locations/data/data_sources/locations_datasource.dart';
import 'package:mobisoft_inspection/features/locations/domain/repositories/location_repository.dart';

import '../../../../core/network/network_info.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationsDataSource _locationsDataSource;
  final NetworkInfo _networkInfo;

  LocationRepositoryImpl(this._networkInfo, this._locationsDataSource);

  @override
  Future<ResponseModel> getAllLocations() async {
    try {
      if (await _networkInfo.isConnected) {
        return await _locationsDataSource.getAllLocations();
      } else {
        return ResponseModel(
            message: ["No Internet Connection"], statusCode: 560);
      }
    } catch (e) {
      return ResponseModel(
        statusCode: 510,
        message: [e.toString()],
      );
    }
  }
}
