import 'package:flutter/services.dart';
import 'package:vibeng/models/video_model.dart';
import 'package:vibeng/models/song_model.dart';
import 'package:vibeng/models/word_model.dart';

class MediaRepository {
  Future<List<VideoModel>> getVideos() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/videos.json',
    );
    return videoModelFromJson(jsonString);
  }

  Future<List<SongModel>> getSongs() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/songs.json',
    );
    return songModelFromJson(jsonString);
  }

  Future<List<WordModel>> getHotWords() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/hotday_words.json',
    );
    return wordModelFromJson(jsonString);
  }

  Future<List<String>> getVideoTopics() async {
    final videos = await getVideos();
    final topics = videos.map((video) => video.topic).toSet().toList();
    return topics;
  }
}
