import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_ibb/bloc/trip_bloc/trip_bloc.dart';
import 'package:test_ibb/data/model/trip_model.dart';
import 'package:test_ibb/view/widgets/custom_button.dart';
import 'package:test_ibb/view/widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _departureCityController;
  late TextEditingController _destinationCityController;
  late TextEditingController _dateController;

  late GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;

  List<Trip>? trips;
  List<String> cities = ["Москва", "Уфа", "Казань"];

  @override
  void initState() {
    _departureCityController = TextEditingController();
    _destinationCityController = TextEditingController();
    _dateController = TextEditingController();
    _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    super.initState();
  }

  @override
  void dispose() {
    _departureCityController.dispose();
    _destinationCityController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "Bus Finder",
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<TripBloc, TripState>(
        listener: (context, state) {
          if (state is TripError) {
            _showSnackbar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is TripLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TripLoadedSuccess) {
            trips = state.trips;
          }
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              findBuses();
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    Row(
                      children: [
                        const Icon(Icons.my_location),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CustomTextField(
                              controller: _departureCityController,
                              hintText: "Departure city"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CustomTextField(
                              controller: _destinationCityController,
                              hintText: "Desstination city"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(children: [
                      const Icon(Icons.calendar_month_rounded),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomTextField(
                            controller: _dateController,
                            hintText: "Date",
                            onTap: () => selectDate(context)),
                      ),
                    ])
                  ]),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(title: "Find", onPress: findBuses),
                ),
                const SizedBox(height: 12),
                trips != null && trips!.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                            padding: const EdgeInsets.all(16),
                            itemCount: trips?.length ?? 0,
                            itemBuilder: (context, index) {
                              return buildTripInfo(trips?[index]);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12)))
                    : trips == null
                        ? const SizedBox()
                        : Container(
                            padding: const EdgeInsets.all(16),
                            child: const Text("Автобусов нет")),
              ],
            ),
          );
        },
      ),
    );
  }

  void selectDate(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    _dateController.text = DateFormat('dd MMMM', 'en_US').format(date!);
  }

  void findBuses() {
    context.read<TripBloc>().add(GetTrips(_departureCityController.text,
        _destinationCityController.text, _dateController.text));
  }

  Widget buildTripInfo(Trip? trip) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          buildDriverInfo(
              trip?.driver1, trip?.bus?.model, trip?.passengerFareCost),
          buildBusInfo(trip?.departure?.name, trip?.departureTime),
          buildBusInfo(trip?.destination?.name, trip?.arrivalTime)
        ],
      ),
    );
  }

  Widget buildDriverInfo(String? driver, String? autoModel, String? price) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(driver ?? ""),
      subtitle: Text(autoModel ?? ""),
      trailing: Text("• $price"),
    );
  }

  Widget buildBusInfo(String? city, String? date) {
    return ListTile(
      leading: const Icon(Icons.radio_button_on),
      title: Text(city ?? ""),
      subtitle: Text(date ?? ""),
      trailing: Text("• Avtovokzal"),
    );
  }

  void _showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
