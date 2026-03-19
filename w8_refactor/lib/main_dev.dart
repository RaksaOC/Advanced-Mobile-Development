import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/view_models/ride_preferences_view_model.dart';
import 'package:provider/provider.dart';

import 'main_common.dart';

List<InheritedProvider> get devProviders {
  final locationRepository = LocationRepositoryMock();
  final ridePrefRepository = RidePreferenceRepositoryMock();
  final rideRepository = RideRepositoryMock();

  return [
    Provider<LocationRepository>(create: (context) => locationRepository),
    Provider<RidePreferenceRepository>(create: (context) => ridePrefRepository),
    Provider<RideRepository>(create: (context) => rideRepository),
  ];
}

void main() {
  mainCommon(devProviders);
}
