import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/song_model.dart';
import 'package:vibeng/repositories/media_repository.dart';
import 'package:vibeng/widgets/media_card.dart'; // Tái sử dụng
import 'package:vibeng/widgets/section_header.dart';

class HomeSongSection extends StatefulWidget {
  const HomeSongSection({super.key});

  @override
  _HomeSongSectionState createState() => _HomeSongSectionState();
}

class _HomeSongSectionState extends State<HomeSongSection> {
  final MediaRepository _repository = MediaRepository();
  late Future<List<SongModel>> _songsFuture;

  @override
  void initState() {
    super.initState();
    _songsFuture = _repository.getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
      future: _songsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              SectionHeader(
                title: AppLocalizations.of(context)!.home_songs,
                showSeeMore: true,
                onSeeMore: () {},
              ),
              Container(height: 250, color: Colors.grey[200]),
            ],
          );
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              SectionHeader(
                title: AppLocalizations.of(context)!.home_songs,
                showSeeMore: true,
                onSeeMore: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Error: ${snapshot.error}'),
              ),
            ],
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final songs = snapshot.data!;

        return Column(
          children: [
            SectionHeader(
              title: AppLocalizations.of(context)!.home_songs,
              showSeeMore: true,
              onSeeMore: () {},
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MediaCard(item: songs[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
