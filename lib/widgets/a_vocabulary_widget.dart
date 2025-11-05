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
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      elevation: 2.0,
      child: ListTile(
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
        leading: ClipOval(
          child: Image.asset(
            imageUrl,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.normal),
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 5.0,
                backgroundColor: const Color.fromARGB(255, 222, 222, 222),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Text(
              '$wordsLearned/$totalWords',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),

        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    );
  }
}
