import '../data/repositories/songs/song_repository_mock.dart';

void main() async {
  //   Instantiate the  song_repository_mock
  final songRepository = SongRepositoryMock();
  // Test both the success and the failure of the post request
  // Handle the Future using 2 ways  (2 tests)
  // - Using then() with .catchError().
  // - Using async/await with try/catch.
  
  songRepository
      .fetchSongById('s1')
      .then((song) {
        print('Song found: ${song?.title}');
      })
      .catchError((error) {
        print('Error: $error');
      });

  try {
    final song = await songRepository.fetchSongById('svs');
    print('Song found: ${song?.title}');
  } catch (error) {
    print('Error: $error');
  }
}
