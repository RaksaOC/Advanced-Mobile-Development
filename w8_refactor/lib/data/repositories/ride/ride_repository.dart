import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';

abstract interface class RideRepository {
  List<Ride> getRidesFor(RidePreference preferences);
}

