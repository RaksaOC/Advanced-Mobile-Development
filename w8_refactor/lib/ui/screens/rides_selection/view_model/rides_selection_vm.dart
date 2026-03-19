import 'package:flutter/foundation.dart';

import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../states/ride_preference_state.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';

class RidesSelectionVM extends ChangeNotifier {
  final RidePreferenceState _ridePreferenceState;
  final RideRepository _rideRepository;

  RidesSelectionVM({
    required RidePreferenceState ridePreferenceState,
    required RideRepository rideRepository,
  }) : _ridePreferenceState = ridePreferenceState,
       _rideRepository = rideRepository {
    _ridePreferenceState.addListener(_onRidePreferenceStateChanged);
    _refreshMatchingRides();
  }

  RidePreference? get selectedPreference =>
      _ridePreferenceState.selectedPreference;

  List<Ride> _matchingRides = const [];
  List<Ride> get matchingRides => _matchingRides;

  void selectPreference(RidePreference preference) {
    _ridePreferenceState.selectPreference(preference);
  }

  void _onRidePreferenceStateChanged() {
    _refreshMatchingRides();
    notifyListeners();
  }

  void _refreshMatchingRides() {
    final pref = _ridePreferenceState.selectedPreference;
    if (pref == null) {
      _matchingRides = const [];
      return;
    }
    _matchingRides = _rideRepository.getRidesFor(pref);
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(_onRidePreferenceStateChanged);
    super.dispose();
  }
}
