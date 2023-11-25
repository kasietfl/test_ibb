import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ibb/data/model/trip_model.dart';
import 'package:test_ibb/data/repositories/trip_repository.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  TripRepository repository = TripRepository();

  TripBloc() : super(TripInitial()) {
    on<GetTrips>(getTrips);
  }

  void getTrips(GetTrips event, Emitter emit) async {
    emit(TripLoading());
    try {
      TripsResponse? response = await repository.getTrips(
          event.departure, event.destination, event.date);
      emit(TripLoadedSuccess(response?.trips));
    } on TripError catch (e) {
      emit(TripError(e.errorMessage));
    }
  }
}
