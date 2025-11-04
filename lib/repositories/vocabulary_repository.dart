import 'package:flutter/services.dart';
import 'package:vibeng/models/vocab_sets_model.dart';
import 'package:vibeng/models/word_detail_model.dart';

class VocabularyRepository {
  Future<List<VocabSetModel>> getVocabularySets() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/vocab_sets.json',
    );
    return vocabSetModelFromJson(jsonString);
  }

  Future<List<WordDetailModel>> getWordsForSet(String setId) async {
    final String path = 'assets/data/vocab_set_$setId.json';

    try {
      final String jsonString = await rootBundle.loadString(path);
      return wordDetailModelFromJson(jsonString);
    } catch (e) {
      print('Lỗi tải file $path: $e');
      return [];
    }
  }
}
