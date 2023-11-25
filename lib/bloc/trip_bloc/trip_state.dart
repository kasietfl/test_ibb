part of 'trip_bloc.dart';

abstract class TripState {}

class TripInitial extends TripState {}

class TripLoading extends TripState {}

class TripLoadedSuccess extends TripState {
  final List<Trip>? trips;

  TripLoadedSuccess(this.trips);
}

class TripError extends TripState {
  final String errorMessage;

  TripError(this.errorMessage);
}
