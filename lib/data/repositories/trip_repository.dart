import 'package:test_ibb/data/model/trip_model.dart';
import 'package:test_ibb/data/services/dio_clent.dart';

class TripRepository {
  final DioClient client = DioClient();

  Future<TripsResponse?> getTrips(
      String departureCity, String destinationCity, String date) async {
    var response =
        await client.getTripsInfo(departureCity, destinationCity, date);

    return response;
  }
}
