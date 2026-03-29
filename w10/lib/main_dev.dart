import 'package:provider/provider.dart';
import 'package:w10/ui/screens/artists/view_model/artists_view_model.dart';
import 'package:w10/ui/screens/library/view_model/library_view_model.dart';
import 'package:w10/services/artists/artists_service.dart';
import 'package:w10/services/artist_detail/artist_detail_service.dart';
import 'package:w10/services/library/library_service.dart';

import 'data/repositories/artist/artist_repository.dart';
import 'data/repositories/artist/artist_repository_firebase.dart';
import 'data/repositories/songs/song_repository_firebase.dart';
import 'main_common.dart';
import 'data/repositories/settings/app_settings_repository_mock.dart';
import 'data/repositories/songs/song_repository.dart';
import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
List<InheritedProvider> get devProviders {
  final appSettingsRepository = AppSettingsRepositoryMock();

  return [
    // 1 - Inject repositories
    Provider<SongRepository>(create: (_) => SongRepositoryFirebase()),
    Provider<ArtistRepository>(create: (_) => ArtistRepositoryFirebase()),

    // 1b - Inject services
    Provider<LibraryService>(
      create: (context) => LibraryService(
        songRepository: context.read<SongRepository>(),
        artistRepository: context.read<ArtistRepository>(),
      ),
    ),
    Provider<ArtistsService>(
      create: (context) =>
          ArtistsService(artistRepository: context.read<ArtistRepository>()),
    ),
    Provider<ArtistDetailService>(
      create: (context) => ArtistDetailService(
        artistRepository: context.read<ArtistRepository>(),
        songRepository: context.read<SongRepository>(),
      ),
    ),

    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
      create: (_) => AppSettingsState(repository: appSettingsRepository),
    ),
    ChangeNotifierProvider<LibraryViewModel>(
      create: (context) => LibraryViewModel(
        libraryService: context.read<LibraryService>(),
        playerState: context.read<PlayerState>(),
      ),
    ),

    ChangeNotifierProvider<ArtistsViewModel>(
      create: (context) =>
          ArtistsViewModel(artistsService: context.read<ArtistsService>()),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
