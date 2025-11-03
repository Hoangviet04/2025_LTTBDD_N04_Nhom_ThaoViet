import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/video_model.dart';
import 'package:vibeng/repositories/media_repository.dart';
import 'package:vibeng/widgets/section_header.dart';
import 'package:vibeng/screens/video_detail_screen.dart';

class VideoTrendingList extends StatefulWidget {
  const VideoTrendingList({super.key});

  @override
  State<VideoTrendingList> createState() => _VideoTrendingListState();
}

class _VideoTrendingListState extends State<VideoTrendingList> {
  List<VideoModel> videoTrendingList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    final videos = await MediaRepository().getVideos();
    if (mounted) {
      videos.shuffle();
      final trendingVideos = videos.take(10).toList();
      setState(() {
        videoTrendingList = trendingVideos;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        SectionHeader(
          title: l10n.video_hot_list_title,
          icon: Image.asset('assets/icons/steak.png', width: 24, height: 24),
        ),
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: videoTrendingList.length,
                    itemBuilder: (context, index) {
                      return TrendingCard(item: videoTrendingList[index]);
                    },
                  ),
                ),
              ),
      ],
    );
  }
}

class TrendingCard extends StatelessWidget {
  final VideoModel item;
  final double width;
  const TrendingCard({super.key, required this.item, this.width = 350});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    const overlayColor = Color.fromARGB(115, 108, 107, 107);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoDetailScreen(video: item),
          ),
        );
      },
      borderRadius: borderRadius,
      child: Container(
        width: width,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(borderRadius: borderRadius),
        child: Stack(
          children: [
            Image.asset(item.imageUrl, width: width, fit: BoxFit.cover),
            Container(decoration: BoxDecoration(color: overlayColor)),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            color: Colors.white.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${item.numberOfLessons} ${AppLocalizations.of(context)!.num_lessons}',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          item.videoTime,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
