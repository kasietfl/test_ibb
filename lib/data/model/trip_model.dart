class TripsResponse {
  final List<Trip>? trips;

  TripsResponse({
    this.trips,
  });

  TripsResponse.fromJson(Map<String, dynamic> json)
      : trips = (json['trips'] as List?)
            ?.map((dynamic e) => Trip.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'trips': trips?.map((e) => e.toJson()).toList()};
}

class Trip {
  final String? id;
  final String? routeId;
  final String? scheduleTripId;
  final String? routeName;
  final String? routeNum;
  final String? carrier;
  final Bus? bus;
  final String? driver1;
  final dynamic driver2;
  final String? frequency;
  final dynamic waybillNum;
  final String? status;
  final String? statusPrint;
  final String? statusReason;
  final dynamic statusComment;
  final dynamic statusDate;
  final Departure? departure;
  final String? departureTime;
  final String? arrivalToDepartureTime;
  final Destination? destination;
  final String? arrivalTime;
  final String? distance;
  final int? duration;
  final bool? transitSeats;
  final int? freeSeatsAmount;
  final String? passengerFareCost;
  final List<dynamic>? fares;
  final int? platform;
  final bool? onSale;
  final List<dynamic>? route;
  final bool? additional;
  final List<dynamic>? additionalTripTime;
  final dynamic transitTrip;
  final dynamic saleStatus;
  final bool? aCBPDP;
  final dynamic factTripReturnTime;
  final String? currency;
  final String? principalTaxId;
  final CarrierData? carrierData;
  final String? passengerFareCostAvibus;

  Trip({
    this.id,
    this.routeId,
    this.scheduleTripId,
    this.routeName,
    this.routeNum,
    this.carrier,
    this.bus,
    this.driver1,
    this.driver2,
    this.frequency,
    this.waybillNum,
    this.status,
    this.statusPrint,
    this.statusReason,
    this.statusComment,
    this.statusDate,
    this.departure,
    this.departureTime,
    this.arrivalToDepartureTime,
    this.destination,
    this.arrivalTime,
    this.distance,
    this.duration,
    this.transitSeats,
    this.freeSeatsAmount,
    this.passengerFareCost,
    this.fares,
    this.platform,
    this.onSale,
    this.route,
    this.additional,
    this.additionalTripTime,
    this.transitTrip,
    this.saleStatus,
    this.aCBPDP,
    this.factTripReturnTime,
    this.currency,
    this.principalTaxId,
    this.carrierData,
    this.passengerFareCostAvibus,
  });

  Trip.fromJson(Map<String, dynamic> json)
      : id = json['Id'] as String?,
        routeId = json['RouteId'] as String?,
        scheduleTripId = json['ScheduleTripId'] as String?,
        routeName = json['RouteName'] as String?,
        routeNum = json['RouteNum'] as String?,
        carrier = json['Carrier'] as String?,
        bus = (json['Bus'] as Map<String, dynamic>?) != null
            ? Bus.fromJson(json['Bus'] as Map<String, dynamic>)
            : null,
        driver1 = json['Driver1'] as String?,
        driver2 = json['Driver2'],
        frequency = json['Frequency'] as String?,
        waybillNum = json['WaybillNum'],
        status = json['Status'] as String?,
        statusPrint = json['StatusPrint'] as String?,
        statusReason = json['StatusReason'] as String?,
        statusComment = json['StatusComment'],
        statusDate = json['StatusDate'],
        departure = (json['Departure'] as Map<String, dynamic>?) != null
            ? Departure.fromJson(json['Departure'] as Map<String, dynamic>)
            : null,
        departureTime = json['DepartureTime'] as String?,
        arrivalToDepartureTime = json['ArrivalToDepartureTime'] as String?,
        destination = (json['Destination'] as Map<String, dynamic>?) != null
            ? Destination.fromJson(json['Destination'] as Map<String, dynamic>)
            : null,
        arrivalTime = json['ArrivalTime'] as String?,
        distance = json['Distance'] as String?,
        duration = json['Duration'] as int?,
        transitSeats = json['TransitSeats'] as bool?,
        freeSeatsAmount = json['FreeSeatsAmount'] as int?,
        passengerFareCost = json['PassengerFareCost'] as String?,
        fares = json['Fares'] as List?,
        platform = json['Platform'] as int?,
        onSale = json['OnSale'] as bool?,
        route = json['Route'] as List?,
        additional = json['Additional'] as bool?,
        additionalTripTime = json['AdditionalTripTime'] as List?,
        transitTrip = json['TransitTrip'],
        saleStatus = json['SaleStatus'],
        aCBPDP = json['ACBPDP'] as bool?,
        factTripReturnTime = json['FactTripReturnTime'],
        currency = json['Currency'] as String?,
        principalTaxId = json['PrincipalTaxId'] as String?,
        carrierData = (json['CarrierData'] as Map<String, dynamic>?) != null
            ? CarrierData.fromJson(json['CarrierData'] as Map<String, dynamic>)
            : null,
        passengerFareCostAvibus = json['PassengerFareCostAvibus'] as String?;

  Map<String, dynamic> toJson() => {
        'Id': id,
        'RouteId': routeId,
        'ScheduleTripId': scheduleTripId,
        'RouteName': routeName,
        'RouteNum': routeNum,
        'Carrier': carrier,
        'Bus': bus?.toJson(),
        'Driver1': driver1,
        'Driver2': driver2,
        'Frequency': frequency,
        'WaybillNum': waybillNum,
        'Status': status,
        'StatusPrint': statusPrint,
        'StatusReason': statusReason,
        'StatusComment': statusComment,
        'StatusDate': statusDate,
        'Departure': departure?.toJson(),
        'DepartureTime': departureTime,
        'ArrivalToDepartureTime': arrivalToDepartureTime,
        'Destination': destination?.toJson(),
        'ArrivalTime': arrivalTime,
        'Distance': distance,
        'Duration': duration,
        'TransitSeats': transitSeats,
        'FreeSeatsAmount': freeSeatsAmount,
        'PassengerFareCost': passengerFareCost,
        'Fares': fares,
        'Platform': platform,
        'OnSale': onSale,
        'Route': route,
        'Additional': additional,
        'AdditionalTripTime': additionalTripTime,
        'TransitTrip': transitTrip,
        'SaleStatus': saleStatus,
        'ACBPDP': aCBPDP,
        'FactTripReturnTime': factTripReturnTime,
        'Currency': currency,
        'PrincipalTaxId': principalTaxId,
        'CarrierData': carrierData?.toJson(),
        'PassengerFareCostAvibus': passengerFareCostAvibus
      };
}

class Bus {
  final String? id;
  final String? model;
  final String? licencePlate;
  final String? name;
  final String? seatsClass;
  final int? seatCapacity;
  final int? standCapacity;
  final int? baggageCapacity;
  final List<dynamic>? seatsScheme;
  final dynamic garageNum;

  Bus({
    this.id,
    this.model,
    this.licencePlate,
    this.name,
    this.seatsClass,
    this.seatCapacity,
    this.standCapacity,
    this.baggageCapacity,
    this.seatsScheme,
    this.garageNum,
  });

  Bus.fromJson(Map<String, dynamic> json)
      : id = json['Id'] as String?,
        model = json['Model'] as String?,
        licencePlate = json['LicencePlate'] as String?,
        name = json['Name'] as String?,
        seatsClass = json['SeatsClass'] as String?,
        seatCapacity = json['SeatCapacity'] as int?,
        standCapacity = json['StandCapacity'] as int?,
        baggageCapacity = json['BaggageCapacity'] as int?,
        seatsScheme = json['SeatsScheme'] as List?,
        garageNum = json['GarageNum'];

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Model': model,
        'LicencePlate': licencePlate,
        'Name': name,
        'SeatsClass': seatsClass,
        'SeatCapacity': seatCapacity,
        'StandCapacity': standCapacity,
        'BaggageCapacity': baggageCapacity,
        'SeatsScheme': seatsScheme,
        'GarageNum': garageNum
      };
}

class Departure {
  final String? name;
  final String? code;
  final String? id;
  final String? country;
  final String? region;
  final dynamic district;
  final bool? automated;
  final bool? hasDestinations;
  final String? uTC;
  final String? gPSCoordinates;
  final String? locationType;
  final dynamic locality;
  final dynamic stoppingPlace;
  final String? address;
  final dynamic phone;

  Departure({
    this.name,
    this.code,
    this.id,
    this.country,
    this.region,
    this.district,
    this.automated,
    this.hasDestinations,
    this.uTC,
    this.gPSCoordinates,
    this.locationType,
    this.locality,
    this.stoppingPlace,
    this.address,
    this.phone,
  });

  Departure.fromJson(Map<String, dynamic> json)
      : name = json['Name'] as String?,
        code = json['Code'] as String?,
        id = json['Id'] as String?,
        country = json['Country'] as String?,
        region = json['Region'] as String?,
        district = json['District'],
        automated = json['Automated'] as bool?,
        hasDestinations = json['HasDestinations'] as bool?,
        uTC = json['UTC'] as String?,
        gPSCoordinates = json['GPSCoordinates'] as String?,
        locationType = json['LocationType'] as String?,
        locality = json['Locality'],
        stoppingPlace = json['StoppingPlace'],
        address = json['Address'] as String?,
        phone = json['Phone'];

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Code': code,
        'Id': id,
        'Country': country,
        'Region': region,
        'District': district,
        'Automated': automated,
        'HasDestinations': hasDestinations,
        'UTC': uTC,
        'GPSCoordinates': gPSCoordinates,
        'LocationType': locationType,
        'Locality': locality,
        'StoppingPlace': stoppingPlace,
        'Address': address,
        'Phone': phone
      };
}

class Destination {
  final String? name;
  final String? code;
  final String? id;
  final String? country;
  final String? region;
  final dynamic district;
  final bool? automated;
  final bool? hasDestinations;
  final String? uTC;
  final String? gPSCoordinates;
  final String? locationType;
  final dynamic locality;
  final dynamic stoppingPlace;
  final String? address;
  final dynamic phone;

  Destination({
    this.name,
    this.code,
    this.id,
    this.country,
    this.region,
    this.district,
    this.automated,
    this.hasDestinations,
    this.uTC,
    this.gPSCoordinates,
    this.locationType,
    this.locality,
    this.stoppingPlace,
    this.address,
    this.phone,
  });

  Destination.fromJson(Map<String, dynamic> json)
      : name = json['Name'] as String?,
        code = json['Code'] as String?,
        id = json['Id'] as String?,
        country = json['Country'] as String?,
        region = json['Region'] as String?,
        district = json['District'],
        automated = json['Automated'] as bool?,
        hasDestinations = json['HasDestinations'] as bool?,
        uTC = json['UTC'] as String?,
        gPSCoordinates = json['GPSCoordinates'] as String?,
        locationType = json['LocationType'] as String?,
        locality = json['Locality'],
        stoppingPlace = json['StoppingPlace'],
        address = json['Address'] as String?,
        phone = json['Phone'];

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Code': code,
        'Id': id,
        'Country': country,
        'Region': region,
        'District': district,
        'Automated': automated,
        'HasDestinations': hasDestinations,
        'UTC': uTC,
        'GPSCoordinates': gPSCoordinates,
        'LocationType': locationType,
        'Locality': locality,
        'StoppingPlace': stoppingPlace,
        'Address': address,
        'Phone': phone
      };
}

class CarrierData {
  final String? carrierName;
  final String? carrierTaxId;
  final dynamic carrierStateRegNum;
  final List<dynamic>? carrierPersonalData;
  final dynamic carrierAddress;
  final String? carrierWorkingHours;

  CarrierData({
    this.carrierName,
    this.carrierTaxId,
    this.carrierStateRegNum,
    this.carrierPersonalData,
    this.carrierAddress,
    this.carrierWorkingHours,
  });

  CarrierData.fromJson(Map<String, dynamic> json)
      : carrierName = json['CarrierName'] as String?,
        carrierTaxId = json['CarrierTaxId'] as String?,
        carrierStateRegNum = json['CarrierStateRegNum'],
        carrierPersonalData = json['CarrierPersonalData'] as List?,
        carrierAddress = json['CarrierAddress'],
        carrierWorkingHours = json['CarrierWorkingHours'] as String?;

  Map<String, dynamic> toJson() => {
        'CarrierName': carrierName,
        'CarrierTaxId': carrierTaxId,
        'CarrierStateRegNum': carrierStateRegNum,
        'CarrierPersonalData': carrierPersonalData,
        'CarrierAddress': carrierAddress,
        'CarrierWorkingHours': carrierWorkingHours
      };
}
