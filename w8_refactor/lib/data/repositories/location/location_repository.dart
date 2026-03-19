import '../../../model/ride/locations.dart';

abstract interface class LocationRepository {
  List<Location> getAvailableLocations();
}

