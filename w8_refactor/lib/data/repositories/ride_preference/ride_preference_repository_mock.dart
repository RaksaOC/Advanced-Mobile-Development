import 'package:blabla/data/dummy_data.dart';

import '../../../model/ride_pref/ride_pref.dart';
import 'ride_preference_repository.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> _history = List.unmodifiable(fakeRidePrefs);

  // maybe can use a fixed set variable for the max allowed seats much cleaner
  @override
  int get maxAllowedSeats => 8;

  @override
  List<RidePreference> getHistory() => List.unmodifiable(_history);

  @override
  void addToHistory(RidePreference preference) {
    _history.add(preference);
  }
}
