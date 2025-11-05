import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/screens/learn_songs_screen.dart';
import 'package:vibeng/screens/learn_videos_screen.dart';
import 'package:vibeng/screens/vocab_sets_screen.dart';
import 'package:vibeng/widgets/section_header.dart';

class LearningChoiceSection extends StatelessWidget {
  const LearningChoiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: l10n.home_learnThrough),
        buildLearningGrid(context, l10n),
      ],
    );
  }

  Widget buildLearningGrid(BuildContext context, AppLocalizations l10n) {
    final items = [
      GridItem(
        l10n.home_songs,
        Icons.music_note,
        const Color.fromARGB(255, 212, 251, 177),
        const Color(0xFFE8F5E9),
        Colors.green[700]!,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LearnSongsScreen()),
          );
        },
      ),
      GridItem(
        l10n.home_videos,
        Icons.videocam,
        const Color.fromARGB(255, 255, 199, 199),
        const Color(0xFFFFEBEE),
        Colors.red,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LearnVideosScreen()),
          );
        },
      ),
      GridItem(
        l10n.home_vocabSet,
        Icons.book,
        const Color(0xFFE0D6FF),
        const Color(0xFFEDE7F6),
        Colors.deepPurple[700]!,
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VocabSetScreen()),
          ),
        },
      ),
    ];

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 15,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: items.map((item) {
        return InkWell(
          onTap: item.onTap,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: item.iconBackgroundColor,
                  child: Icon(item.icon, size: 28, color: item.iconColor),
                ),
                const SizedBox(height: 12),
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class GridItem {
  final String title;
  final IconData icon;
  final Color color;
  final Color iconBackgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  GridItem(
    this.title,
    this.icon,
    this.color,
    this.iconBackgroundColor,
    this.iconColor, {
    this.onTap,
  });
}
