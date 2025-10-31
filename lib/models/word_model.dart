import 'dart:convert';

class WordModel {
  String id, text, pronunciation, meaning, imageUrl;
  int saveCount;

  WordModel({
    required this.id,
    required this.text,
    required this.pronunciation,
    required this.meaning,
    required this.imageUrl,
    required this.saveCount,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      id: json["id"],
      text: json["text"],
      pronunciation: json["pronunciation"],
      meaning: json["meaning"],
      imageUrl: json["imageUrl"],
      saveCount: json["saveCount"],
    );
  }
}

List<WordModel> wordModelFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  final List<WordModel> wordList = jsonData.map((item) {
    return WordModel.fromJson(item);
  }).toList();
  return wordList;
}
