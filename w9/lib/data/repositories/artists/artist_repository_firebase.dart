import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../data/dtos/artist_dto.dart';
import '../../../model/artists/artist.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri =
      Uri.https('fir-test-37360.firebaseio.com', '/artists.json');

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load artists');
    }

    final decoded = json.decode(response.body);

    if (decoded is! Map<String, dynamic>) {
      throw Exception('Failed to parse artists response');
    }

    final artistsAny = decoded['artists'];
    final Map<dynamic, dynamic> artistsMap;

    if (artistsAny is Map) {
      artistsMap = artistsAny;
    } else {
      artistsMap = decoded;
    }

    final List<Artist> artistList = [];

    for (final entry in artistsMap.entries) {
      final artistId = entry.key.toString();
      final rawAny = entry.value;

      if (rawAny is Map<String, dynamic>) {
        artistList.add(ArtistDto.fromJson(rawAny, artistId));
        continue;
      }

      if (rawAny is Map) {
        final Map<String, dynamic> raw = {};
        for (final rawEntry in rawAny.entries) {
          raw[rawEntry.key.toString()] = rawEntry.value;
        }
        artistList.add(ArtistDto.fromJson(raw, artistId));
        continue;
      }

      throw Exception('Invalid artist payload for id $artistId');
    }

    return artistList;
  }
}

