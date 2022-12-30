import 'package:get_it/get_it.dart';

import 'features/registeration/presentation/manager/login_approach_cubit.dart';

final locator = GetIt.instance;

void setup(){
  // ------ Cubit ----
  locator.registerLazySingleton<LoginApproachCubit>(() => LoginApproachCubit());
}
