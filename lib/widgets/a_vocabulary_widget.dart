import 'package:flutter/material.dart';
import 'package:vibeng/screens/vocab_setDetail_screen.dart';

class VocabularyWidget extends StatelessWidget {
  final String setId;
  final String title;
  final String imageUrl;
  final int wordsLearned;
  final int totalWords;

  const VocabularyWidget({
    super.key,
    required this.setId,
    required this.title,
    required this.imageUrl,
    required this.wordsLearned,
    required this.totalWords,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (totalWords > 0)
        ? (wordsLearned / totalWords)
        : 0.0;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VocabSetDetailScreen(
                title: title,
                setId: setId,
                wordsLearned: wordsLearned,
                totalWords: totalWords,
                progress: progress,
              ),
            ),
          );
        },

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 5.0,
                            backgroundColor: const Color.fromARGB(
                              255,
                              222,
                              222,
                              222,
                            ),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          '$wordsLearned/$totalWords',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
