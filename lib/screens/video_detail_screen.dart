import 'package:flutter/material.dart';
import 'package:vibeng/models/video_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoDetailScreen extends StatefulWidget {
  final VideoModel video;

  const VideoDetailScreen({super.key, required this.video});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayerController.convertUrlToId(
      widget.video.videoUrl,
    );
    if (videoId == null) {
      throw Exception('URL không hợp lệ: ${widget.video.videoUrl}');
    }
    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.video.title)),
      body: YoutubePlayerScaffold(
        controller: _controller,
        builder: (context, player) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(aspectRatio: 16 / 9, child: player),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.video.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.people, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Text('${widget.video.numberOfLessons} lessons'),
                        const SizedBox(width: 16),
                        Icon(Icons.timer, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Text(widget.video.videoTime),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Video subtitle will be displayed here.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
