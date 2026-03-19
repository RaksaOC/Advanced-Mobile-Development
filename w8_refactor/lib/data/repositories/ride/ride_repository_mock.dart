import '../../../data/dummy_data.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'ride_repository.dart';

class RideRepositoryMock implements RideRepository {
  final List<Ride> _allRides = List.unmodifiable(fakeRides);

  @override
  List<Ride> getRidesFor(RidePreference preferences) => _allRides
      .where(
        (ride) =>
            ride.departureLocation == preferences.departure &&
            ride.arrivalLocation == preferences.arrival &&
            ride.availableSeats >= preferences.requestedSeats,
      )
      .toList();
}
