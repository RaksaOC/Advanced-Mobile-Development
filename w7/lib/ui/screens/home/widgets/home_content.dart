import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7/ui/screens/home/widgets/home_content_card.dart';

import '../../../theme/theme.dart';
import '../../../widgets/song/song_tile.dart';
import '../view_model/home_view_model.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel mv = context.watch<HomeViewModel>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(mv.viewTitle, style: AppTextStyles.heading),
            SizedBox(height: 50),

            SizedBox(height: 20),

            HomeContentCard(type: HomeContentType.favorite),
            HomeContentCard(type: HomeContentType.lastSongs),
          ],
        ),
      ),
    );
  }
}
