import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/video_model.dart';
import 'package:vibeng/repositories/media_repository.dart';
import 'package:vibeng/widgets/media_card.dart';
import 'package:vibeng/widgets/section_header.dart';

class VideoByLevel extends StatefulWidget {
  const VideoByLevel({super.key});

  @override
  State<VideoByLevel> createState() => _VideoByLevelState();
}

class _VideoByLevelState extends State<VideoByLevel> {
  List<VideoModel> videosByLevel = [];
  bool isLoading = true;
  final List<String> levels = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'];

  @override
  void initState() {
    super.initState();
    loadVideos();
  }

  Future<void> loadVideos() async {
    final videos = await MediaRepository().getVideos();
    if (mounted) {
      setState(() {
        videosByLevel = videos;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: levels.map((level) {
        final videosForLevel = videosByLevel
            .where((video) => video.level == level)
            .toList();
        if (videosForLevel.isEmpty) {
          return const SizedBox.shrink();
        }

        return VideoLevelSection(
          level: level,
          title: l10n.video_by_level_title(level),
          videos: videosForLevel,
        );
      }).toList(),
    );
  }
}

class VideoLevelSection extends StatelessWidget {
  final String level;
  final String title;
  final List<VideoModel> videos;

  const VideoLevelSection({
    super.key,
    required this.level,
    required this.title,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeader(title: title),
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                final video = videos[index];
                return MediaCard(item: video, width: 280);
              },
            ),
          ),
        ],
      ),
    );
  }
}
