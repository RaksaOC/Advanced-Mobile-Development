import 'package:provider/provider.dart';
import 'package:practice/data/repositories/songs/song_repository_remote.dart';
import 'main_common.dart';

/// Configure provider dependencies for dev environement
List<Provider> get providersLocal {
  return [
    Provider<SongRepositoryRemote>(create: (context) => SongRepositoryRemote()),
  ];
}

void main() {
  mainCommon(providersLocal);
}
