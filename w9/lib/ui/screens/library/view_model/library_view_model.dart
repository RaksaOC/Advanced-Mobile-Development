import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../data/repositories/artists/artist_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';
import '../../../../model/songs/song_artist.dart';
import '../../../../model/artists/artist.dart';
import '../../../utils/async_value.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final ArtistRepository artistRepository;
  final PlayerState playerState;

  AsyncValue<List<SongArtist>> songsValue = AsyncValue.loading();

  LibraryViewModel({
    required this.songRepository,
    required this.artistRepository,
    required this.playerState,
  }) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    fetchSong();
  }

  void fetchSong() async {
    // 1- Loading state
    songsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      final songs = await songRepository.fetchSongs();
      final artists = await artistRepository.fetchArtists();

      final Map<String, Artist> artistById = {};
      for (final artist in artists) {
        artistById[artist.id] = artist;
      }

      final List<SongArtist> joined = [];
      for (final song in songs) {
        final artist =
            artistById[song.artistId] ??
            Artist(id: song.artistId, name: 'Unknown', genre: '', imageUrl: '');

        joined.add(SongArtist(song: song, artist: artist));
      }

      songsValue = AsyncValue.success(joined);
    } catch (e) {
      // 3- Fetch is unsucessfull
      songsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
