import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7/ui/screens/home/view_model/home_view_model.dart';
import 'package:w7/ui/widgets/song/song_tile.dart';

enum HomeContentType { favorite, lastSongs }

class HomeContentCard extends StatelessWidget {
  final HomeContentType type;

  const HomeContentCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    HomeViewModel mv = context.watch<HomeViewModel>();

    final songs = type == HomeContentType.favorite
        ? mv.favoriteSongs
        : mv.lastPlayedSongs;

    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        shape: const Border(),
        title: Text(
          type == HomeContentType.favorite
              ? "My favorite songs"
              : "My last songs",
        ),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: songs.length,
            itemBuilder: (context, index) => SongTile(
              song: songs[index],
              isPlaying: mv.isSongPlaying(songs[index]),
              onTap: () {
                mv.start(songs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
