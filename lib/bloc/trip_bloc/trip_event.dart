part of 'trip_bloc.dart';

abstract class TripEvent {}

class GetTrips extends TripEvent {
  final String departure;
  final String destination;
  final String date;

  GetTrips(this.departure, this.destination, this.date);
}
