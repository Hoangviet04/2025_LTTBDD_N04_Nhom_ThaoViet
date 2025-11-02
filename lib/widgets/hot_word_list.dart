import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/word_model.dart';
import 'package:vibeng/repositories/media_repository.dart';
import 'package:vibeng/widgets/section_header.dart';

class HotWordList extends StatefulWidget {
  const HotWordList({super.key});

  @override
  _HotWordListState createState() => _HotWordListState();
}

class _HotWordListState extends State<HotWordList> {
  final MediaRepository _repository = MediaRepository();
  List<WordModel>? hotWords;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadHotWords();
  }

  Future<void> loadHotWords() async {
    final data = await _repository.getHotWords();
    if (mounted) {
      setState(() {
        hotWords = data;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
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

class HotWordCard extends StatelessWidget {
  final WordModel word;
  final double width;

  const HotWordCard({required this.word, this.width = 280});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    const overlayColor = Color.fromARGB(115, 108, 107, 107);
    const secondaryTextColor = Color.fromARGB(255, 215, 214, 214);

    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 16),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: borderRadius),
      child: Stack(
        children: [
          Image.asset(
            word.imageUrl,
            width: width,
            height: 200,
            fit: BoxFit.cover,
          ),

          Container(
            width: width,
            height: 200,
            decoration: BoxDecoration(color: overlayColor),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      word.text,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          word.pronunciation,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.volume_up,
                          size: 24,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      word.meaning,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.bookmark_sharp,
                      size: 20,
                      color: secondaryTextColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${word.saveCount} lượt lưu",
                      style: const TextStyle(
                        color: secondaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
