import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/widgets/section_header.dart';

class VideoTopics extends StatelessWidget {
  const VideoTopics({super.key});

  List<Map<String, dynamic>> getTopicsList(AppLocalizations l10n) {
    return [
      {
        'key': 'news',
        'name': l10n.video_topic_news,
        'assets': 'assets/imgs/topics/news.jpg',
      },
      {
        'key': 'travel_culture',
        'name': l10n.video_topic_travel_culture,
        'assets': 'assets/imgs/topics/travel_culture.jpg',
      },
      {
        'key': 'short_films',
        'name': l10n.video_topic_short_films,
        'assets': 'assets/imgs/topics/short_films.jpg',
      },
      {
        'key': 'podcast',
        'name': l10n.video_topic_podcast,
        'assets': 'assets/imgs/topics/podcast.jpg',
      },
      {
        'key': 'history',
        'name': l10n.video_topic_history,
        'assets': 'assets/imgs/topics/history.jpg',
      },
      {
        'key': 'food_lifestyle',
        'name': l10n.video_topic_food_lifestyle,
        'assets': 'assets/imgs/topics/food_lifestyle.jpg',
      },
      {
        'key': 'health',
        'name': l10n.video_topic_health,
        'assets': 'assets/imgs/topics/health.jpg',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final topics = getTopicsList(l10n);

    return Column(
      children: [
        SectionHeader(title: l10n.video_topic_all),
        Container(
          height: 225,

          child: GridView.builder(
            padding: const EdgeInsets.only(left: 16, right: 16),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              childAspectRatio: 0.6,
            ),
            itemCount: topics.length,
            itemBuilder: (context, index) {
              final topic = topics[index];
              final name = topic['name'];
              final asset = topic['assets'];

              return InkWell(
                onTap: () {
                  print('Đã ấn ${topic['key']}');
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(asset, fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        left: 12,
                        right: 12,
                        bottom: 10,
                        child: Text(
                          name,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
