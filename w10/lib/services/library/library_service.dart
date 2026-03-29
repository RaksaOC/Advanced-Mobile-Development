import '../../data/repositories/artist/artist_repository.dart';
import '../../data/repositories/songs/song_repository.dart';
import '../../model/artist/artist.dart';
import '../../model/songs/song.dart';
import '../../ui/screens/library/view_model/library_item_data.dart';

class LibraryService {
  final SongRepository _songRepository;
  final ArtistRepository _artistRepository;

  LibraryService({
    required SongRepository songRepository,
    required ArtistRepository artistRepository,
  }) : _songRepository = songRepository,
       _artistRepository = artistRepository;

  Future<List<LibraryItemData>> fetchLibraryItems({
    bool forceFetch = false,
  }) async {
    final songs = await _songRepository.fetchSongs(forceFetch: forceFetch);
    final artists = await _artistRepository.fetchArtists(forceFetch: forceFetch);

    final Map<String, Artist> artistById = {};
    for (final artist in artists) {
      artistById[artist.id] = artist;
    }

    final List<LibraryItemData> result = [];
    for (final song in songs) {
      final artist = artistById[song.artistId];
      if (artist == null) continue;
      result.add(LibraryItemData(song: song, artist: artist));
    }
    return result;
  }

  Future<Song> likeSong(String id) => _songRepository.likeSong(id);

  Future<void> refreshSongs() => _songRepository.fetchSongs(forceFetch: true);
}

