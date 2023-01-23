
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_location_state.dart';

class AddLocationCubit extends Cubit<AddLocationState> {
  AddLocationCubit() : super(AddLocationInitial());
}
