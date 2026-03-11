import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w8/model/songs/song.dart';
import 'package:w8/utils/async_value.dart';
import '../../../theme/theme.dart';
import '../../../widgets/song/song_tile.dart';
import '../view_model/library_view_model.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryViewModel libVM = context.watch<LibraryViewModel>();
    AsyncValue<List<Song>> asyncValue = libVM.songsState;

    switch (asyncValue.state) {
      case AsyncState.error:
        return Center(child: Text('Error gettingsongs!'));
      case AsyncState.loading:
        return Center(child: CircularProgressIndicator());
      case AsyncState.success:
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text("Library", style: AppTextStyles.heading),
              SizedBox(height: 50),

              Expanded(
                child: ListView.builder(
                  itemCount: libVM.songs.length,
                  itemBuilder: (context, index) => SongTile(
                    song: libVM.songs[index],
                    isPlaying: libVM.isSongPlaying(libVM.songs[index]),
                    onTap: () {
                      libVM.start(libVM.songs[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}
