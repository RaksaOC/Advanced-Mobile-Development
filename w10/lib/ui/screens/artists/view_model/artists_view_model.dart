import 'package:flutter/material.dart';
import '../../../../services/artists/artists_service.dart';
import '../../../../model/artist/artist.dart';
import '../../../utils/async_value.dart';

class ArtistsViewModel extends ChangeNotifier {
  final ArtistsService artistsService;

  AsyncValue<List<Artist>> artistsValue = AsyncValue.loading();

  ArtistsViewModel({required this.artistsService}) {
    _init();
  }

  void _init() async {
    fetchArtists();
  }

  void fetchArtists() async {
    artistsValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Artist> artists = await artistsService.fetchArtists();
      artistsValue = AsyncValue.success(artists);
    } catch (e) {
      artistsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await artistsService.fetchArtists(forceFetch: true);
  }
}