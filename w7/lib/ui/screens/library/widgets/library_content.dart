import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7/ui/screens/library/widgets/song_tile.dart';

import '../../../states/settings_state.dart';
import '../../../theme/theme.dart';
import '../view_model/library_view_model.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryViewModel viewModel = context.watch<LibraryViewModel>();
    AppSettingsState settingsState = context.watch<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),
          const SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.songs.length,
              itemBuilder: (context, index) {
                final song = viewModel.songs[index];
                return SongTile(
                  song: song,
                  isPlaying: viewModel.isPlaying(song),
                  onTap: () {
                    viewModel.play(song);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
