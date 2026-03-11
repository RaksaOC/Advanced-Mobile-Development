import 'package:w8/data/repositories/songs/song_repository_mock.dart';

void main() async {
  // Instantiate the song_repository_mock
  final songRepo = SongRepositoryMock();

  print('&&&&&&&& Test 1: using then() / catchError() *********');

  //  fetchSongs using then/catchError - (SUCCESS)
  await songRepo
      .fetchSongs()
      .then((songs) {
        print('success: fetched ${songs.length} songs');
        for (var s in songs) {
          print('  + ${s.title}');
        }
      })
      .catchError((e) {
        print('error: $e');
      });

  // fetchSongById with invalid id using then/catchError - (FAIL)
  await songRepo
      .fetchSongById('invalid_id')
      .then((song) {
        if (song == null) {
          print('No song found for the id.');
        } else {
          print('song found: ${song.title}');
        }
      })
      .catchError((e) {
        print('error: $e');
      });

  print('&&&&&&&& Test 2: using async/await with try/catch *********');

  // fetchSongs using async/await (try/catch) - SUCCESS
  try {
    final songs = await songRepo.fetchSongs();
    print('success: fetched ${songs.length} songs');
    for (var s in songs) {
      print('  + ${s.title}');
    }
  } catch (e) {
    print('error: $e');
  }

  // fetchSongById with invalid id using async/await (try/catch) - (FAIL)
  try {
    final song = await songRepo.fetchSongById('invalid_id');
    if (song == null) {
      print('No song found for the id.');
    } else {
      print('song found: ${song.title}');
    }
  } catch (e) {
    print('error: $e');
  }
}
