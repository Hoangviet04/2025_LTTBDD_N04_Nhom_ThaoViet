import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/song_model.dart';
import 'package:vibeng/repositories/media_repository.dart';
import 'package:vibeng/widgets/media_card.dart'; // Tái sử dụng
import 'package:vibeng/screens/learn_songs_screen.dart';
import 'package:vibeng/widgets/section_header.dart';

class HomeSongSection extends StatefulWidget {
  const HomeSongSection({super.key});

  @override
  _HomeSongSectionState createState() => _HomeSongSectionState();
}

class _HomeSongSectionState extends State<HomeSongSection> {
  final MediaRepository _repository = MediaRepository();
  List<SongModel>? songList;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  Future<void> loadSongs() async {
    final data = await _repository.getSongs();
    if (!mounted) return;
    setState(() {
      songList = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final songs = songList!;

    return Column(
      children: [
        SectionHeader(
          title: l10n.home_songs,
          showSeeMore: true,
          onSeeMore: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const LearnSongsScreen()));
          },
        ),
        SizedBox(
          height: 251,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: songs.length < 5 ? songs.length : 5,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return MediaCard(item: songs[index]);
            },
          ),
        ),
      ],
    );
  }
}
