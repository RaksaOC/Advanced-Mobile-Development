import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(
    'fir-test-37360.firebaseio.com',
    '/songs.json',
  );

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      final decoded = json.decode(response.body);

      if (decoded is Map<String, dynamic>) {
        final songs = decoded['songs'];
        if (songs is Map<String, dynamic>) {
          return songs.entries.map((entry) {
            final songId = entry.key;
            final raw = entry.value;
            if (raw is Map<String, dynamic>) {
              return SongDto.fromJson(raw, songId);
            }
            if (raw is Map) {
              return SongDto.fromJson(
                raw.map((k, v) => MapEntry(k.toString(), v)),
                songId,
              );
            }
            throw Exception('Invalid song payload for id $songId');
          }).toList();
        }
      }

      throw Exception('Failed to parse songs response');
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    final songs = await fetchSongs();
    try {
      return songs.firstWhere((song) => song.id == id);
    } catch (_) {
      return null;
    }
  }
}
