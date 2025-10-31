import 'dart:convert';

class VideoModel {
  String id, title, views, videoTime, topic, videoUrl, imageUrl;
  int numberOfLessons;

  VideoModel({
    required this.id,
    required this.title,
    required this.views,
    required this.videoTime,
    required this.topic,
    required this.videoUrl,
    required this.imageUrl,
    required this.numberOfLessons,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json["id"],
      title: json["title"],
      views: json["views"],
      numberOfLessons: json["numberOfLessons"],
      videoTime: json["videoTime"],
      topic: json["topic"],
      videoUrl: json["videoUrl"],
      imageUrl: json["imageUrl"],
    );
  }
}

List<VideoModel> videoModelFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  final List<VideoModel> videoList = jsonData.map((item) {
    return VideoModel.fromJson(item);
  }).toList();
  return videoList;
}
