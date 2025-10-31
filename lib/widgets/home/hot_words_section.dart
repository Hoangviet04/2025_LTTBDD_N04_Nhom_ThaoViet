import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/word_model.dart';
import 'package:vibeng/repositories/media_repository.dart';
import 'package:vibeng/widgets/hot_word_card.dart';
import 'package:vibeng/widgets/section_header.dart';

class HotWordsSection extends StatefulWidget {
  const HotWordsSection({super.key});

  @override
  _HotWordsSectionState createState() => _HotWordsSectionState();
}

class _HotWordsSectionState extends State<HotWordsSection> {
  final MediaRepository _repository = MediaRepository();
  late Future<List<WordModel>> _hotWordsFuture;

  @override
  void initState() {
    super.initState();
    _hotWordsFuture = _repository.getHotWords();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WordModel>>(
      future: _hotWordsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(height: 200, color: Colors.grey[200]);
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final words = snapshot.data!;

        return Column(
          children: [
            SectionHeader(
              title: AppLocalizations.of(context)!.home_hotWordsToday,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: words.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return HotWordCard(word: words[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
