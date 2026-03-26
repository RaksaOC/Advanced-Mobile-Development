import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../data/dtos/artist_dto.dart';
import '../../../model/artists/artist.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https(
    'fir-test-ef8b3-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );

  @override
  Future<List<Artist>> fetchArtists() async {
    try {
      final http.Response response = await http.get(artistsUri);

      if (response.statusCode == 200) {
        Map<String, dynamic> artistJson = json.decode(response.body);
        List<Artist> artists = [];

        for (var key in artistJson.keys) {
          var data = artistJson[key];
          artists.add(ArtistDto.fromJson(data, key));
        }
        return artists;
      } else {
        throw Exception("Falied to load artists");
      }
    } catch (e) {
      throw Exception("Failed to load artists");
    }
  }
}
