import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_ibb/bloc/trip_bloc/trip_bloc.dart';
import 'package:test_ibb/data/model/trip_model.dart';
import 'package:test_ibb/view/widgets/custom_button.dart';
import 'package:test_ibb/view/widgets/custom_drop_down_button.dart';
import 'package:test_ibb/view/widgets/custom_textfield.dart';
import 'package:test_ibb/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _dateController;
  late HomeViewModel viewModel;
  DateTime currentDate = DateTime.now();

  List<String> cities = ["Москва", "Уфа", "Казань"];
  List<Trip>? trips;

  String? selectedDepCity;
  String? selectedDesCity;
  String selectedDate = "";

  @override
  void initState() {
    viewModel = HomeViewModel();
    _dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text("Bus Finder"), centerTitle: true),
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
          return buildBody();
        },
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        buildSearchSection(),
        const SizedBox(height: 12),
        buildFindButton(),
        const SizedBox(height: 12),
        buildTripList()
      ],
    );
  }

  Widget buildSearchSection() {
    return RefreshIndicator(
      displacement: 80,
      onRefresh: () async {
        findBuses();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Row(
              children: [
                const Icon(Icons.my_location),
                const SizedBox(width: 12),
                Expanded(
                    child: CustomDropDownButton(
                        selectedItem: selectedDepCity,
                        items: cities,
                        hint: "Departure city",
                        callback: (city) {
                          setState(() {
                            selectedDepCity = city;
                          });
                        }))
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 12),
                Expanded(
                    child: CustomDropDownButton(
                        selectedItem: selectedDesCity,
                        items: cities,
                        hint: "Destination city",
                        callback: (city) {
                          setState(() {
                            selectedDesCity = city;
                          });
                        }))
              ],
            ),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.calendar_month_rounded),
              const SizedBox(width: 12),
              Expanded(
                child: CustomTextField(
                    controller: _dateController,
                    hintText: "Date",
                    onTap: () => selectDate(context)),
              ),
            ])
          ]),
        ),
      ),
    );
  }

  Widget buildFindButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomButton(title: "Find", onPress: findBuses),
    );
  }

  Widget buildTripList() {
    return trips != null && trips!.isNotEmpty
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
                child: const Text("No bus found"));
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
      title: Text(driver ?? "Водитель"),
      subtitle: Text(autoModel ?? ""),
      trailing: Text("• $price р."),
    );
  }

  ListTile buildBusInfo(String? city, String? date) {
    String formattedDate =
        DateFormat('d-MMMM | HH:mm').format(DateTime.parse(date ?? ""));
    return ListTile(
      leading: const Icon(Icons.radio_button_on),
      title: Text(city ?? ""),
      subtitle: Text(formattedDate),
    );
  }

  void findBuses() => viewModel.findBuses(
      context, selectedDepCity, selectedDesCity, selectedDate);

  void selectDate(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate.subtract(const Duration(days: 30)),
      lastDate: currentDate.add(const Duration(days: 30)),
    );
    _dateController.text = DateFormat('d-MMMM').format(date!);
    selectedDate = DateFormat("yyyy-MM-dd").format(date);
  }

  void _showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 3)),
    );
  }
}
