import 'package:flutter/material.dart';
import 'package:vibeng/models/video_model.dart';

class VideoDetailScreen extends StatelessWidget {
  final VideoModel video;

  const VideoDetailScreen({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(video.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              video.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.people, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Text('${video.numberOfLessons} lessons'),
                      const SizedBox(width: 16),
                      Icon(Icons.timer, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Text(video.videoTime),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Video content will be displayed here',
                    style: Theme.of(context).textTheme.bodyLarge,
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
