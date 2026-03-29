import 'package:flutter/material.dart';
import '../../../../services/library/library_service.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';
import '../../../utils/async_value.dart';
import 'library_item_data.dart';

class LibraryViewModel extends ChangeNotifier {
  final LibraryService libraryService;

  final PlayerState playerState;

  AsyncValue<List<LibraryItemData>> data = AsyncValue.loading();

  LibraryViewModel({
    required this.libraryService,
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
    data = AsyncValue.loading();
    notifyListeners();

    try {
      final items = await libraryService.fetchLibraryItems();
      data = AsyncValue.success(items);
    } catch (e) {
      // 3- Fetch is unsucessfull
      data = AsyncValue.error(e);
    }
    notifyListeners();
  }

  void likeSong(String id) async {
    try {
      final Song updatedSong = await libraryService.likeSong(id);

      final List<LibraryItemData> currentSongsData = data.data!;
      final List<LibraryItemData> updatedSongsData = [];

      for (var currentSongData in currentSongsData) {
        if (currentSongData.song.id == id) {
          updatedSongsData.add(
            LibraryItemData(song: updatedSong, artist: currentSongData.artist),
          );
        } else {
          updatedSongsData.add(currentSongData);
        }
      }

      data = AsyncValue.success(updatedSongsData);
    } catch (e) {
      data = AsyncValue.error(e);
    }

    notifyListeners();
  }

  Future<void> onRefresh() async {
    await libraryService.refreshSongs();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}