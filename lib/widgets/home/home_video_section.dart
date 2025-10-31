import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/video_model.dart';
import 'package:vibeng/repositories/media_repository.dart';
import 'package:vibeng/widgets/media_card.dart';
import 'package:vibeng/widgets/section_header.dart';

class HomeVideoSection extends StatefulWidget {
  const HomeVideoSection({super.key});
  @override
  _HomeVideoSectionState createState() => _HomeVideoSectionState();
}

class _HomeVideoSectionState extends State<HomeVideoSection> {
  final MediaRepository _repository = MediaRepository();
  late Future<List<VideoModel>> _videosFuture;

  @override
  void initState() {
    super.initState();
    _videosFuture = _repository.getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VideoModel>>(
      future: _videosFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              SectionHeader(
                title: AppLocalizations.of(context)!.home_videos,
                showSeeMore: true,
                onSeeMore: () {},
              ),
              Container(height: 250, color: Colors.grey[200]),
            ],
          );
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              SectionHeader(
                title: AppLocalizations.of(context)!.home_videos,
                showSeeMore: true,
                onSeeMore: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Error: ${snapshot.error}'),
              ),
            ],
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final videos = snapshot.data!;

        return Column(
          children: [
            SectionHeader(
              title: AppLocalizations.of(context)!.home_videos,
              showSeeMore: true,
              onSeeMore: () {},
            ),
            SizedBox(
              height: 250, // Chiều cao của card
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: videos.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MediaCard(item: videos[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
