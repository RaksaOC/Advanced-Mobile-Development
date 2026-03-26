import 'package:flutter/material.dart';

import '../../../model/songs/song_artist.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final SongArtist song;
  final bool isPlaying;
  final VoidCallback onTap;

  String get durationText {
    final minutes = song.song.duration.inMinutes;
    final seconds = song.song.duration.inSeconds % 60;
    return '${minutes} mins ${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundImage: song.artistImageUrl.isNotEmpty
                ? NetworkImage(song.artistImageUrl)
                : null,
            child: song.artistImageUrl.isNotEmpty
                ? null
                : const Icon(Icons.music_note, color: Colors.amber),
          ),
          title: Text(song.title),
          subtitle: Row(
            children: [
              Container(
                child: Text(
                  '${song.artistName} - ${song.artistGenre}',
                  style: const TextStyle(color: Colors.blueGrey),
                ),
              ),
              const SizedBox(width: 8),
              Text(durationText, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
