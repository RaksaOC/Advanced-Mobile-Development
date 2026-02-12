// import 'package:blabla/model/ride/ride.dart';

// import 'package:blabla/model/ride/locations.dart';
// import 'package:blabla/services/rides_service.dart';

// void main() {
//   Location dijon = Location(country: Country.france, name: "Dijon");
//   RidesService ridesService = RidesService();
//   // where seat requestedf is nuill
//   List<Ride> filteredRideNoSeats = ridesService.filterBy(
//     departure: Location(name: "London", country: Country.uk),
//   );
//   print("// where seat requestedf is nuill");
//   print(filteredRideNoSeats);
//   // where seat location is nuill
//   List<Ride> filteredRideNoLocation = ridesService.filterBy(seatRequested: 1);
//   print("// // where seat location is nuill");
//   print(filteredRideNoLocation);
//   // by departure
//   List<Ride> filteredRideByDepart = ridesService.filterByDeparture(
//     Location(name: "London", country: Country.uk),
//   );
//   print("// // // by departure");
//   print(filteredRideByDepart);

//   // by seat requested
//   List<Ride> filteredRideBySeatRequested = ridesService.filterBySeatRequest(1);
//   print("/// by seat requested");
//   print(filteredRideBySeatRequested);
// }
