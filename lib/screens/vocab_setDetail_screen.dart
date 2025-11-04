import 'package:flutter/material.dart';
import 'package:vibeng/models/word_detail_model.dart';
import 'package:vibeng/theme.dart';
import 'package:vibeng/repositories/vocabulary_repository.dart';
import 'package:vibeng/screens/flashcard_screen.dart';

class VocabSetDetailScreen extends StatefulWidget {
  final String setId;
  final String title;
  final int wordsLearned;
  final int totalWords;
  final double progress;

  const VocabSetDetailScreen({
    super.key,
    required this.title,
    required this.setId,
    required this.wordsLearned,
    required this.totalWords,
    required this.progress,
  });

  @override
  State<VocabSetDetailScreen> createState() => _VocabSetDetailScreenState();
}

class _VocabSetDetailScreenState extends State<VocabSetDetailScreen> {
  final VocabularyRepository repository = VocabularyRepository();
  List<WordDetailModel> vocabularies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadVocabularies();
  }

  Future<void> loadVocabularies() async {
    final vocabs = await repository.getWordsForSet(widget.setId);
    if (mounted) {
      setState(() {
        vocabularies = vocabs;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            const Color.fromARGB(255, 208, 175, 255).withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _showPracticeModes(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: primaryColor, width: 1.5),
                      ),
                    ),

                    child: Row(
                      children: [
                        Icon(
                          Icons.playlist_play_rounded,
                          color: primaryColor,
                          size: 30.0,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          'Luyện tập',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: widget.progress,
                      minHeight: 5.0,
                      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    '${widget.wordsLearned} / ${widget.totalWords}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: _bodyVocabDetail(),
        ),
      ),
    );
  }

  Widget _bodyVocabDetail() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20.0),
      itemCount: vocabularies.length,
      itemBuilder: (context, index) {
        final vocab = vocabularies[index];
        return VocabularyCard(vocabulary: vocab);
      },
    );
  }

  void _showPracticeModes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.45,

        expand: false,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Chọn chế độ luyện tập',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.style_outlined),
                        title: const Text('Flashcards'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FlashcardScreen(vocabularies: vocabularies),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.record_voice_over_outlined),
                        title: const Text('Luyện nói'),
                        onTap: () => Navigator.pop(context),
                      ),
                      ListTile(
                        leading: const Icon(Icons.quiz_outlined),
                        title: const Text('Chọn nghĩa'),
                        onTap: () => Navigator.pop(context),
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit_outlined),
                        title: const Text('Điền từ'),
                        onTap: () => Navigator.pop(context),
                      ),
                      ListTile(
                        leading: const Icon(Icons.hearing_outlined),
                        title: const Text('Nghe và chọn nghĩa đúng'),
                        onTap: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class VocabularyCard extends StatelessWidget {
  final WordDetailModel vocabulary;

  const VocabularyCard({super.key, required this.vocabulary});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vocabulary.word,
                    style: textTheme.titleLarge?.copyWith(color: primaryColor),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    vocabulary.pronunciation!,
                    style: textTheme.titleMedium?.copyWith(
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    vocabulary.meaning,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  '(${vocabulary.partOfSpeech})',
                  style: textTheme.titleSmall?.copyWith(
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    color: Color.fromARGB(255, 198, 158, 255),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
