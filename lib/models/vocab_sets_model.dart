import 'dart:convert';

List<VocabSetModel> vocabSetModelFromJson(String str) =>
    List<VocabSetModel>.from(
      json.decode(str).map((x) => VocabSetModel.fromJson(x)),
    );

class VocabSetModel {
  final String id;
  final String title;
  final String imagePath;
  final int currentProgress;
  final int totalItems;

  VocabSetModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.currentProgress,
    required this.totalItems,
  });

  factory VocabSetModel.fromJson(Map<String, dynamic> json) => VocabSetModel(
    id: json["id"],
    title: json["title"],
    imagePath: json["imagePath"],
    currentProgress: json["currentProgress"],
    totalItems: json["totalItems"],
  );
}
