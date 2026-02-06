import '../data/dummy_data.dart';
import '../model/ride_pref/ride_pref.dart';

////
///   This service handles:
///   - History of the last ride preferences        (to allow users to re-use their last preferences)
///   - Curent selected ride preferences.
///
/// this acts kinda like a global fake data, maybe we should catch it at teh ui to make it not coupled
class RidePrefsService {
  static RidePref? selectedRidePref; // The current selected ride preference

  static List<RidePref> ridePrefsHistory = fakeRidePrefs;
}
