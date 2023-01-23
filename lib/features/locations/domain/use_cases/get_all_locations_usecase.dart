import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:mobisoft_inspection/features/locations/domain/repositories/location_repository.dart';

import '../../../../core/usecase/usecase.dart';

class GetAllLocationsUseCase implements UseCase<Future<ResponseModel>, void> {
  final LocationRepository locationRepository;

  GetAllLocationsUseCase(this.locationRepository);

  @override
  Future<ResponseModel> call(void params) {
    return locationRepository.getAllLocations();
  }
}
