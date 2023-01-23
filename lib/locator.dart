import 'package:api_handler/feature/api_handler/presentation/presentation_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobisoft_inspection/features/locations/data/data_sources/locations_datasource.dart';
import 'package:mobisoft_inspection/features/locations/data/repositories/location_repository_impl.dart';
import 'package:mobisoft_inspection/features/locations/domain/repositories/location_repository.dart';
import 'package:mobisoft_inspection/features/locations/domain/use_cases/get_all_locations_usecase.dart';
import 'package:mobisoft_inspection/features/locations/presentation/manager/add_location_cubit/add_location_cubit.dart';
import 'package:mobisoft_inspection/features/locations/presentation/manager/location_cubit.dart';
import 'package:mobisoft_inspection/features/registeration/presentation/manager/sms_login_cubit.dart';
import 'core/network/network_info.dart';
import 'features/registeration/presentation/manager/login_approach/login_approach_cubit.dart';

final locator = GetIt.instance;

void setup() {
  locationInject();
  // ------ Cubit ----
  locator.registerLazySingleton<LoginApproachCubit>(() => LoginApproachCubit());
  locator.registerLazySingleton<SmsLoginCubit>(() => SmsLoginCubit());

  // *----- Network Info -----*
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  locator.registerLazySingleton<APIHandler>(() => APIHandler());
}

void locationInject() {
  // ------ Cubit ----
  locator.registerLazySingleton<LocationCubit>(() => LocationCubit(locator()));
  locator.registerLazySingleton<AddLocationCubit>(() => AddLocationCubit());

  // ------ UseCase ----
  locator.registerLazySingleton<GetAllLocationsUseCase>(
      () => GetAllLocationsUseCase(locator()));

  // ------ Repository ----
  locator.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(locator(), locator()));

  // ------ DataSource ----
  locator.registerLazySingleton<LocationsDataSource>(
      () => LocationsDataSourceImpl(locator()));
}
