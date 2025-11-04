import 'dart:convert';

List<WordDetailModel> wordDetailModelFromJson(String str) =>
    List<WordDetailModel>.from(
      json.decode(str).map((x) => WordDetailModel.fromJson(x)),
    );

class WordDetailModel {
  final String id;
  final String word;
  final String? pronunciation;
  final String? partOfSpeech;
  final String meaning;
  final String? example;
  final String? audioUrl;

  WordDetailModel({
    required this.id,
    required this.word,
    this.pronunciation,
    this.partOfSpeech,
    required this.meaning,
    this.example,
    this.audioUrl,
  });

  factory WordDetailModel.fromJson(Map<String, dynamic> json) {
    return WordDetailModel(
      id: json['id'] as String,
      word: json['word'] as String,
      pronunciation: json['pronunciation'] as String?,
      partOfSpeech: json['partOfSpeech'] as String?,
      meaning: json['meaning'] as String,
      example: json['example'] as String?,
      audioUrl: json['audioUrl'] as String?,
    );
  }
}
