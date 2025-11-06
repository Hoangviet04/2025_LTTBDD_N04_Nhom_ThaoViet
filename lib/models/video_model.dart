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

  const VideoModel({
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
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      views: json['views'] ?? '',
      numberOfLessons: json['numberOfLessons'] is int
          ? json['numberOfLessons']
          : int.tryParse(json['numberOfLessons'].toString()) ?? 0,
      videoTime: json['videoTime'] ?? '',
      topic: json['topic'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      level: json['level'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'views': views,
    'numberOfLessons': numberOfLessons,
    'videoTime': videoTime,
    'topic': topic,
    'videoUrl': videoUrl,
    'imageUrl': imageUrl,
    'level': level,
  };
}

List<VideoModel> videoModelFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  return jsonData.map((item) => VideoModel.fromJson(item)).toList();
}
