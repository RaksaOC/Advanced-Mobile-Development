import '../../../model/ride_pref/ride_pref.dart';

abstract interface class RidePreferenceRepository {
  int get maxAllowedSeats;
  List<RidePreference> getHistory();
  void addToHistory(RidePreference preference);
}
