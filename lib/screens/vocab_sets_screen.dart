import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/vocab_sets_model.dart';
import 'package:vibeng/repositories/vocabulary_repository.dart';
import 'package:vibeng/theme.dart';
import 'package:vibeng/widgets/a_vocabulary_widget.dart';

class VocabSetScreen extends StatefulWidget {
  const VocabSetScreen({super.key});

  @override
  State<VocabSetScreen> createState() => _VocabSetScreenState();
}

class _VocabSetScreenState extends State<VocabSetScreen> {
  final VocabularyRepository _repository = VocabularyRepository();
  List<VocabSetModel> vocabSets = [];
  bool isLoading = true;

  @override
  void initState() {
    _loadVocabularySets();
    super.initState();
  }

  void _loadVocabularySets() async {
    final sets = await _repository.getVocabularySets();
    setState(() {
      vocabSets = sets;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      color: Colors.deepPurple,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(l10n.vocab_sets_title),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: l10n.vocab_sets_search_hint,
                  hintStyle: TextStyle(color: secondaryColor),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: _bodyVocabSetScreen(l10n),
        ),
      ),
    );
  }

  Widget _bodyVocabSetScreen(AppLocalizations l10n) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80.0),
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
    );
  }
}
