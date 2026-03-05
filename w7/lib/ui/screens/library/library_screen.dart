import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';
import '../library/view_model/library_view_model.dart';
import '../library/widgets/library_content.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SongRepository songRepository = context.read<SongRepository>();
    PlayerState playerState = context.read<PlayerState>();

    return ChangeNotifierProvider<LibraryViewModel>(
      create: (_) => LibraryViewModel(
        songRepository: songRepository,
        playerState: playerState,
      )..init(),
      child: const LibraryContent(),
    );
  }
}
