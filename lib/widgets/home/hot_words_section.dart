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
  List<WordModel>? hotWords;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadHotWords();
  }

  Future<void> loadHotWords() async {
    try {
      final data = await _repository.getHotWords();
      setState(() {
        hotWords = data;
        isLoading = false;
      });
    } catch (_) {
      setState(() {
        hotWords = const [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(height: 200, color: Colors.grey[200]);
    }
    if (hotWords == null || hotWords!.isEmpty) {
      return const SizedBox.shrink();
    }

    final words = hotWords!;

    return Column(
      children: [
        SectionHeader(title: AppLocalizations.of(context)!.home_hotWordsToday),
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
  }
}
