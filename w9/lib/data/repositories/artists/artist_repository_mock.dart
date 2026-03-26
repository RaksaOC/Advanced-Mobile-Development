import '../../../model/artists/artist.dart';
import 'artist_repository.dart';

class ArtistRepositoryMock implements ArtistRepository {
  final List<Artist> _artists = [
    Artist(
      id: 'artist_1',
      name: 'VannDa',
      genre: 'Hip-Hop',
      imageUrl:
          'https://images.unsplash.com/photo-1511379938547-c1f69419868d',
    ),
    Artist(
      id: 'artist_2',
      name: 'Tena',
      genre: 'Pop',
      imageUrl:
          'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91',
    ),
    Artist(
      id: 'artist_3',
      name: 'G-Devith',
      genre: 'Hip-Hop',
      imageUrl:
          'https://images.unsplash.com/photo-1497032205916-ac775f0649ae',
    ),
  ];

  @override
  Future<List<Artist>> fetchArtists() async {
    return _artists;
  }
}

