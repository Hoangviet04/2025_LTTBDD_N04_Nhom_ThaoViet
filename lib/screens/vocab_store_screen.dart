import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/screens/my_notebook_screen.dart';
import 'package:vibeng/screens/vocab_sets_screen.dart';
import 'package:vibeng/theme.dart';
import 'package:vibeng/widgets/section_header.dart';
import 'package:vibeng/repositories/vocabulary_repository.dart';
import 'package:vibeng/models/vocab_sets_model.dart';
import 'package:vibeng/widgets/a_vocabulary_widget.dart';
import 'package:vibeng/widgets/charts/weekly_progress_chart.dart';

class VocabStoreScreen extends StatelessWidget {
  const VocabStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      color: primaryColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(l10n.vocab_store_title),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: _buildVocabStoreScreen(l10n),
        ),
      ),
    );
  }

  Widget _buildVocabStoreScreen(AppLocalizations l10n) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          ProgressBoard(l10n: l10n),
          SizedBox(height: 16.0),
          MyNotebook(),
          SizedBox(height: 16.0),
          SetsVocab(),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class ProgressBoard extends StatefulWidget {
  final AppLocalizations l10n;
  const ProgressBoard({super.key, required this.l10n});

  @override
  State<ProgressBoard> createState() => _ProgressBoardState();
}

class _ProgressBoardState extends State<ProgressBoard> {
  final List<int> weeklyData = [5, 8, 3, 12, 7, 0, 3];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionHeader(title: widget.l10n.vocab_store_progress_broad),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          elevation: 2.0,
          child: Column(
            children: [
              SizedBox(height: 16.0),
              Row(
                children: [
                  SizedBox(width: 16.0),
                  Icon(Icons.check_circle_outline, color: Colors.purple[200]),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      widget.l10n.total_learned,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Text(
                    '100 ${widget.l10n.words_learned}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 16.0),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  SizedBox(width: 16.0),
                  Icon(Icons.check_circle_outline, color: Colors.purple[200]),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      widget.l10n.streak_of_me,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Text(
                    '2 ${widget.l10n.days}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: primaryColor,
                    ),
                  ),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.orange,
                    size: 25,
                  ),
                  SizedBox(width: 8.0),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  SizedBox(width: 16.0),
                  Icon(Icons.check_circle_outline, color: Colors.purple[200]),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      widget.l10n.words_learned_week,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Text(
                    '3 ${widget.l10n.words_learned}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 16.0),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hoạt động 7 ngày',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),

              WeeklyProgressChart(weeklyData: weeklyData),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ],
    );
  }
}

class MyNotebook extends StatefulWidget {
  const MyNotebook({super.key});

  @override
  State<MyNotebook> createState() => _MyNotebookState();
}

class _MyNotebookState extends State<MyNotebook> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: AppLocalizations.of(context)!.vocab_store_my_notebook,
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 223, 245, 251),
              child: Icon(
                Icons.menu_book_rounded,
                color: primaryColor,
                size: 35.0,
              ),
            ),
            title: Text(
              "My Notebook",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              "12 ${AppLocalizations.of(context)!.words_learned}",
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyNotebookScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SetsVocab extends StatefulWidget {
  const SetsVocab({super.key});

  @override
  State<SetsVocab> createState() => _SetsVocabState();
}

class _SetsVocabState extends State<SetsVocab> {
  final VocabularyRepository repository = VocabularyRepository();
  List<VocabSetModel> vocabSets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadVocabSets();
  }

  Future<void> loadVocabSets() async {
    final sets = await repository.getVocabularySets();
    if (mounted) {
      setState(() {
        vocabSets = (sets..shuffle()).take(3).toList();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: AppLocalizations.of(context)!.vocab_sets_title,
          showSeeMore: true,
          onSeeMore: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (c) => const VocabSetScreen()));
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: vocabSets.length,
          itemBuilder: (context, index) {
            final set = vocabSets[index];
            return VocabularyWidget(
              setId: set.id,
              title: set.title,
              imageUrl: set.imagePath,
              wordsLearned: set.currentProgress,
              totalWords: set.totalItems,
            );
          },
        ),
      ],
    );
  }
}
