import 'package:flutter/foundation.dart';

import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository _repo;

  RidePreferenceState({required RidePreferenceRepository repo}) : _repo = repo;

  RidePreference? _selectedPreference;

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory => _repo.getHistory();
  int get maxAllowedSeats => _repo.maxAllowedSeats;

  void selectPreference(RidePreference preference) {
    if (preference == _selectedPreference) return;
    _selectedPreference = preference;
    _repo.addToHistory(preference);
    notifyListeners();
  }
}

