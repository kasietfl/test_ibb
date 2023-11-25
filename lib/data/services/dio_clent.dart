import 'package:dio/dio.dart';
import 'package:test_ibb/data/model/trip_model.dart';

class DioClient {
  final Dio _dio = Dio();

  Future<TripsResponse> getTripsInfo(
      String departureCity, String destinationCity, String date) async {
    try {
      String url = "https://bibiptrip.com/api/avibus/search_trips_cities/";
      Map<String, dynamic> params = {
        "departure_city": departureCity,
        "destination_city": destinationCity,
        "date": date
      };

      final response = await _dio.get(url, queryParameters: params);
      return TripsResponse.fromJson(response.data);
    } catch (error) {
      throw Exception('Error getting data from API: ${error.toString()}');
    }
  }
}
