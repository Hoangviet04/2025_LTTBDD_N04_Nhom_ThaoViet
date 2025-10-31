import 'package:flutter/material.dart';
import 'package:vibeng/widgets/home/home_app_bar.dart';
import 'package:vibeng/widgets/home/user_info_section.dart';
import 'package:vibeng/widgets/home/hot_words_section.dart';
import 'package:vibeng/widgets/home/home_video_section.dart';
import 'package:vibeng/widgets/home/home_song_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 16),
            const UserInfoSection(),

            const HotWordsSection(),
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
