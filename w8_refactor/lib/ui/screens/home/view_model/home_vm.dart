import 'package:flutter/foundation.dart';

import '../../../states/ride_preference_state.dart';
import '../../../../model/ride_pref/ride_pref.dart';

class HomeVM extends ChangeNotifier {
  final RidePreferenceState _ridePreferenceState;

  HomeVM({required RidePreferenceState ridePreferenceState})
    : _ridePreferenceState = ridePreferenceState {
    _ridePreferenceState.addListener(_onRidePreferenceStateChanged);
  }

  RidePreference? get selectedPreference =>
      _ridePreferenceState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _ridePreferenceState.preferenceHistory;

  void selectPreference(RidePreference preference) {
    _ridePreferenceState.selectPreference(preference);
  }

  void _onRidePreferenceStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(_onRidePreferenceStateChanged);
    super.dispose();
  }
}
