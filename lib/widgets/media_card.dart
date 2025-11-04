import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/video_model.dart';
import 'package:vibeng/models/song_model.dart';

class MediaCard extends StatelessWidget {
  final dynamic item;
  final double width;

  const MediaCard({
    super.key,
    required this.item,
    this.width = 220,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final bool isVideo = item is VideoModel;
    final bool isSong = item is SongModel;

    final displayTopic = isVideo
        ? item.topic
        : (isSong ? item.artist : 'N/A');
    final displayLessons = isVideo
        ? item.numberOfLessons
        : (isSong ? item.numberOfLessons : 0);
    final videoTime = isVideo
        ? item.videoTime
        : '';

    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  height: 124,
                  width: double.infinity,
                  child: Image.asset(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (
                          context,
                          error,
                          stackTrace,
                        ) {
                          return Container(
                            color:
                                Colors.grey[200],
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                            ),
                          );
                        },
                  ),
                ),
                if (videoTime.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.all(
                      8.0,
                    ),
                    padding:
                        const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                    decoration: BoxDecoration(
                      color: Colors.grey
                          .withOpacity(0.6),
                      borderRadius:
                          BorderRadius.circular(
                            4,
                          ),
                    ),
                    child: Text(
                      videoTime,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    displayTopic,

                    style: textTheme.titleSmall,

                    maxLines: 1,

                    overflow:
                        TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    item.title,

                    style: textTheme.titleMedium,

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${item.views} ${l10n.views} | $displayLessons ${l10n.lessons}',

                    style: textTheme.labelSmall
                        ?.copyWith(fontSize: 13),

                    maxLines: 1,

                    overflow:
                        TextOverflow.ellipsis,
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
