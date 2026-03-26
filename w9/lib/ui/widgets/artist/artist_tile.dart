import 'package:flutter/material.dart';

import '../../../model/artists/artist.dart';
import '../../theme/theme.dart';

class ArtistTile extends StatelessWidget {
  const ArtistTile({
    super.key,
    required this.artist,
  });

  final Artist artist;

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
          leading: CircleAvatar(
            backgroundImage: artist.imageUrl.isNotEmpty
                ? NetworkImage(artist.imageUrl)
                : null,
            child: artist.imageUrl.isEmpty
                ? const Icon(Icons.person, color: Colors.amber)
                : null,
          ),
          title: Text(artist.name, style: AppTextStyles.title),
          subtitle: Text(
            artist.genre,
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),
        ),
      ),
    );
  }
}

