import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/video_model.dart';
import 'package:vibeng/repositories/media_repository.dart';
import 'package:vibeng/screens/learn_videos_screen.dart';
import 'package:vibeng/widgets/media_card.dart';
import 'package:vibeng/widgets/section_header.dart';

class HomeVideoSection extends StatefulWidget {
  const HomeVideoSection({super.key});
  @override
  _HomeVideoSectionState createState() => _HomeVideoSectionState();
}

class _HomeVideoSectionState extends State<HomeVideoSection> {
  final MediaRepository repository = MediaRepository();
  List<VideoModel> videosList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadVideos();
  }

  Future<void> loadVideos() async {
    final data = await repository.getVideos();
    if (!mounted) return;
    setState(() {
      videosList = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final videos = videosList;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        SectionHeader(
          title: l10n.home_videos,
          showSeeMore: true,
          onSeeMore: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LearnVideosScreen()),
            );
          },
        ),
        SizedBox(
          height: 251,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length < 5 ? videos.length : 5,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return MediaCard(item: videos[index]);
            },
          ),
        ),
      ],
    );
  }
}
