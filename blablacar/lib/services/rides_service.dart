import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

import '../data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
///
class RidesService {
  static List<Ride> allRides = fakeRides;

  List<Ride> filterByDeparture(Location departure) {
    return allRides
        .where((ride) => ride.departureLocation == departure)
        .toList();
  }

  List<Ride> filterBySeatRequest(int seatRequested) {
    return allRides
        .where((ride) => ride.remainingSeats >= seatRequested)
        .toList();
  }

  List<Ride> filterBy({Location? departure, int? seatRequested}) {
    return allRides.where((ride) {
      final matchesDeparture =
          departure == null || ride.departureLocation == departure;
      final matchesSeats =
          seatRequested == null || ride.remainingSeats >= seatRequested;
      return matchesDeparture && matchesSeats;
    }).toList();
  }
}
