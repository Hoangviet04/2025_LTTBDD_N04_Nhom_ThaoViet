import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/song_model.dart';
import 'package:vibeng/models/user_model.dart';
import 'package:vibeng/models/video_model.dart';
import 'package:vibeng/repositories/user_repository.dart';
import 'package:vibeng/widgets/activity_media_banner.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late Future<UserDataModel> _userDataFuture;
  late Future<List<SongModel>> _songsFuture;
  late Future<List<VideoModel>> _videosFuture;

  @override
  void initState() {
    super.initState();
    _userDataFuture = _loadUserData();
    _songsFuture = _loadSongs();
    _videosFuture = _loadVideos();
  }

  Future<UserDataModel> _loadUserData() async {
    final userRepository = UserRepository();
    final userDataList = await userRepository.getUserData();
    return userDataList.first;
  }

  Future<List<SongModel>> _loadSongs() async {
    final String response = await rootBundle.loadString(
      'assets/data/songs.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => SongModel.fromJson(json)).toList();
  }

  Future<List<VideoModel>> _loadVideos() async {
    final String response = await rootBundle.loadString(
      'assets/data/videos.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => VideoModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(220.0),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Color.fromARGB(255, 170, 136, 230)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<UserDataModel>(
                  future: _userDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      final userData = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            l10n.activity_title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.home_hello(userData.username),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage('assets/icons/UK.png'),
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    l10n.english,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.flash_on,
                                    color: Colors.yellow,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '100 XP',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Icon(
                                    Icons.local_fire_department,
                                    color: Colors.orange,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    userData.streak.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Transform.translate(
                                offset: const Offset(-70, -30),
                                child: Transform.scale(
                                  scale: 1.75,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 52,
                                        height: 52,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            const CircularProgressIndicator(
                                              value: 0.7,
                                              strokeWidth: 8,
                                              backgroundColor: Colors.white24,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    Colors.orange,
                                                  ),
                                            ),
                                            Center(
                                              child: Text(
                                                userData.streak.toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        l10n.level,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: Text('No data'));
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: l10n.activity_tab_learned),
                Tab(text: l10n.activity_tab_liked),
                Tab(text: l10n.activity_tab_viewed),
              ],
              labelColor: Colors.purple,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.purple,
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: Future.wait([_songsFuture, _videosFuture]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final List<SongModel> songs = snapshot.data![0];
                    final List<VideoModel> videos = snapshot.data![1];
                    final List<dynamic> allMedia = [...songs, ...videos];

                    return TabBarView(
                      children: [
                        // Tab 1: Đã Học (Learned)
                        ListView.builder(
                          itemCount: allMedia.length,
                          itemBuilder: (context, index) {
                            return ActivityMediaBanner(item: allMedia[index]);
                          },
                        ),
                        // Tab 2: Đã Thích (Liked)
                        ListView.builder(
                          itemCount: allMedia.length,
                          itemBuilder: (context, index) {
                            return ActivityMediaBanner(item: allMedia[index]);
                          },
                        ),
                        // Tab 3: Đã Xem (Viewed)
                        ListView.builder(
                          itemCount: allMedia.length,
                          itemBuilder: (context, index) {
                            return ActivityMediaBanner(item: allMedia[index]);
                          },
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: Text('No media found'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
