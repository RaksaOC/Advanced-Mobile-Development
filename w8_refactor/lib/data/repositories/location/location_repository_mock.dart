import '../../../data/dummy_data.dart';
import '../../../model/ride/locations.dart';
import 'location_repository.dart';

class LocationRepositoryMock implements LocationRepository {
  final List<Location> _allLocations = List.unmodifiable(fakeLocations);
  @override
  List<Location> getAvailableLocations() => _allLocations;
}

