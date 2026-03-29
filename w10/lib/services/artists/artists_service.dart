import '../../data/repositories/artist/artist_repository.dart';
import '../../model/artist/artist.dart';

class ArtistsService {
  final ArtistRepository _artistRepository;

  ArtistsService({required ArtistRepository artistRepository})
    : _artistRepository = artistRepository;

  Future<List<Artist>> fetchArtists({bool forceFetch = false}) {
    return _artistRepository.fetchArtists(forceFetch: forceFetch);
  }
}

