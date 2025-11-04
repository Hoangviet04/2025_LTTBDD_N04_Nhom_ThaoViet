import 'dart:convert';

class VideoModel {
  final String id;
  final String title;
  final String views;
  final int numberOfLessons;
  final String videoTime;
  final String topic;
  final String videoUrl;
  final String imageUrl;
  final String level;

  VideoModel({
    required this.id,
    required this.title,
    required this.views,
    required this.numberOfLessons,
    required this.videoTime,
    required this.topic,
    required this.videoUrl,
    required this.imageUrl,
    required this.level,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      views: json['views'] ?? '',
      numberOfLessons: json['numberOfLessons'] ?? 0,
      videoTime: json['videoTime'] ?? '',
      topic: json['topic'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      level: json['level'] ?? '',
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
