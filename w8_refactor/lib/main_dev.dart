import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:provider/provider.dart';

import 'main_common.dart';

List<InheritedProvider> get devProviders {
  // mock deps for dev
  final locationRepository = LocationRepositoryMock();
  final ridePrefRepository = RidePreferenceRepositoryMock();
  final rideRepository = RideRepositoryMock();

  return [
    Provider<LocationRepository>(create: (context) => locationRepository),
    Provider<RidePreferenceRepository>(create: (context) => ridePrefRepository),
    Provider<RideRepository>(create: (context) => rideRepository),
    ChangeNotifierProvider<RidePreferenceState>(
      create: (context) => RidePreferenceState(repo: ridePrefRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
