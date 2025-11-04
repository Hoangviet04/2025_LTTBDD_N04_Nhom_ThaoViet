import 'dart:convert';

List<WordDetailModel> wordDetailModelFromJson(String str) =>
    List<WordDetailModel>.from(
      json.decode(str).map((x) => WordDetailModel.fromJson(x)),
    );

class WordDetailModel {
  final String id;
  final String word;
  final String pronunciation;
  final String meaning;
  final String audioUrl;

  WordDetailModel({
    required this.id,
    required this.word,
    required this.pronunciation,
    required this.meaning,
    required this.audioUrl,
  });

  factory WordDetailModel.fromJson(Map<String, dynamic> json) =>
      WordDetailModel(
        id: json["id"],
        word: json["word"],
        pronunciation: json["pronunciation"],
        meaning: json["meaning"],
        audioUrl: json["audioUrl"],
      );
}
