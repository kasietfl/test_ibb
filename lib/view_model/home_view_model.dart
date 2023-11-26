import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_ibb/bloc/trip_bloc/trip_bloc.dart';

class HomeViewModel {
  void findBuses(BuildContext context, String? selectedDepCity,
      String? selectedDesCity, String selectedDate) {
    context.read<TripBloc>().add(
        GetTrips(selectedDepCity ?? "", selectedDesCity ?? "", selectedDate));
  }
}
