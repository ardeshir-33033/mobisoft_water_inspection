part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationPending extends LocationState {}

class LocationSuccess extends LocationState {}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
