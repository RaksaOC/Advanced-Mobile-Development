import '../artists/artist.dart';
import 'song.dart';

class SongArtist {
  final Song song;
  final Artist artist;

  const SongArtist({required this.song, required this.artist});

  String get title => song.title;
  String get artistName => artist.name;
  String get artistGenre => artist.genre;
  String get artistImageUrl => artist.imageUrl;
}
