// song_repository_mock.dart

import '../../../model/songs/song.dart';
import 'song_repository.dart';

class SongRepositoryMock implements SongRepository {
  final List<Song> _songs = [
    Song(
      id: 's1',
      title: 'Mock Song 1',
      artistId: 'artist_1',
      imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91',
      duration: const Duration(minutes: 2, seconds: 50),
    ),
    Song(
      id: 's2',
      title: 'Mock Song 2',
      artistId: 'artist_1',
      imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: 's3',
      title: 'Mock Song 3',
      artistId: 'artist_2',
      imageUrl: 'https://images.unsplash.com/photo-1511379938547-c1f69419868d',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: 's4',
      title: 'Mock Song 4',
      artistId: 'artist_2',
      imageUrl: 'https://images.unsplash.com/photo-1511379938547-c1f69419868d',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: 's5',
      title: 'Mock Song 5',
      artistId: 'artist_3',
      imageUrl: 'https://images.unsplash.com/photo-1497032205916-ac775f0649ae',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
  ];

  @override
  Future<List<Song>> fetchSongs() async {
    return Future.delayed(Duration(seconds: 4), () {
      throw Exception("G3 and G4 the class is finished");
    });
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    return Future.delayed(Duration(seconds: 4), () {
      return _songs.firstWhere(
        (song) => song.id == id,
        orElse: () => throw Exception("No song with id $id in the database"),
      );
    });
  }
}
