import 'dart:convert';

class SongModel {
  String id, title, artist, views, genre, audioUrl, imageUrl;
  int numberOfLessons;

  SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.views,
    required this.numberOfLessons,
    required this.genre,
    required this.audioUrl,
    required this.imageUrl,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json["id"],
      title: json["title"],
      artist: json["artist"],
      views: json["views"],
      numberOfLessons: json["numberOfLessons"],
      genre: json["genre"],
      audioUrl: json["audioUrl"],
      imageUrl: json["imageUrl"],
    );
  }
}

List<SongModel> songModelFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  final List<SongModel> songList = jsonData.map((item) {
    return SongModel.fromJson(item);
  }).toList();
  return songList;
}
