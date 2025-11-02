import 'package:flutter/material.dart';
import 'package:vibeng/main.dart';
import 'package:vibeng/widgets/home/home_song_section.dart';
import 'package:vibeng/widgets/home/home_video_section.dart';
import 'package:vibeng/widgets/home/learning_choice_section.dart';

import 'package:vibeng/widgets/home/streak_card.dart';
import 'package:vibeng/widgets/home/welcome_card.dart';
import 'package:vibeng/widgets/hot_word_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildLanguageSelector(
    BuildContext context,
    String languageCode,
    String languageText,
  ) {
    final myAppState = MyApp.of(context);
    final currentLocale = myAppState?.locale ?? const Locale('vi');
    final bool isSelected = currentLocale.languageCode == languageCode;

    return GestureDetector(
      onTap: () => myAppState?.setLocale(Locale(languageCode)),
      child: Text(
        languageText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.white : Colors.white70,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("VibeNG"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                buildLanguageSelector(context, 'vi', 'VN'),
                const SizedBox(width: 4),
                const Text(
                  '|',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(width: 4),
                buildLanguageSelector(context, 'en', 'EN'),
              ],
            ),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const WelcomeCard(),
            const SizedBox(height: 16),
            const LearningChoiceSection(),
            const SizedBox(height: 16),
            const StreakCard(),
            const SizedBox(height: 16),
            const HotWordList(),
            const SizedBox(height: 16),
            const HomeVideoSection(),
            const SizedBox(height: 16),
            const HomeSongSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
