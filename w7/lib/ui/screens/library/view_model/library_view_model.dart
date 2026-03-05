import 'package:flutter/widgets.dart';

import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;

  List<Song> _songs = [];

  LibraryViewModel({
    required this.songRepository,
    required this.playerState,
  }) {
    playerState.addListener(_handlePlayerStateChanged);
  }

  List<Song> get songs => _songs;

  Song? get currentSong => playerState.currentSong;

  Future<void> init() async {
    _songs = songRepository.fetchSongs();
    notifyListeners();
  }

  bool isPlaying(Song song) {
    return currentSong == song;
  }

  void play(Song song) {
    playerState.start(song);
  }

  void stop() {
    playerState.stop();
  }

  void _handlePlayerStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    playerState.removeListener(_handlePlayerStateChanged);
    super.dispose();
  }
}

