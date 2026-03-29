import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w10/model/artist/artist.dart';
import 'package:w10/services/artist_detail/artist_detail_service.dart';
import 'package:w10/ui/screens/artist_detail/view_model/artist_detail_view_model.dart';
import 'package:w10/ui/screens/artist_detail/widgets/artist_detail_content.dart';
import 'package:w10/ui/states/settings_state.dart';

class ArtistDetailScreen extends StatelessWidget {
  final Artist artist;

  const ArtistDetailScreen({super.key, required this.artist});
  @override
  Widget build(BuildContext context) {
    final bg = context.watch<AppSettingsState>().theme.backgroundColor;
    return ChangeNotifierProvider(
      create: (context) => ArtistDetailViewModel(
        artistDetailService: context.read<ArtistDetailService>(),
        artist: artist,
      ),
      child: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(title: Text(artist.name)),
        body: ArtistDetailContent(),
      ),
    );
  }
}
