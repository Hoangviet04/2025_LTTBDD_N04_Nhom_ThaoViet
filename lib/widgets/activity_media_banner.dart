import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/video_model.dart';
import 'package:vibeng/models/song_model.dart';
import 'package:vibeng/screens/play_songs_screen.dart';

class ActivityMediaBanner extends StatelessWidget {
  final dynamic item;

  const ActivityMediaBanner({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final bool isVideo = item is VideoModel;
    final bool isSong = item is SongModel;

    final String title = item.title;
    final String author = isVideo ? item.topic : (isSong ? item.artist : 'N/A');
    final String imageUrl = item.imageUrl;
    final int numberOfLessons = item.numberOfLessons;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          if (isSong) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlaySongsScreen(song: item),
              ),
            );
          } else if (isVideo) {
            print('Tapped on video: ${item.title}');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      author,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$numberOfLessons ${l10n.lessons}',
                      style: textTheme.labelSmall?.copyWith(
                        color: Colors.blueGrey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
