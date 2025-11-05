import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/song_model.dart';
import 'package:vibeng/theme.dart';
import 'package:vibeng/widgets/media_card.dart';
import 'package:vibeng/screens/play_songs_screen.dart';

class Artist {
  final String id;
  final String name;
  final String imageUrl;

  Artist({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Artist.fromJson(
    Map<String, dynamic> json,
  ) {
    return Artist(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}

class LearnSongsScreen extends StatefulWidget {
  const LearnSongsScreen({super.key});

  @override
  State<LearnSongsScreen> createState() =>
      _LearnSongsScreenState();
}

class _LearnSongsScreenState
    extends State<LearnSongsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<SongModel>> _songsFuture;
  late Future<List<Artist>> _artistsFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _songsFuture = _loadSongs();
    _artistsFuture = _loadArtists();
  }

  Future<List<Artist>> _loadArtists() async {
    final String jsonString = await rootBundle
        .loadString('assets/data/artist.json');
    final List<dynamic> jsonList = json.decode(
      jsonString,
    );
    return jsonList
        .map((json) => Artist.fromJson(json))
        .toList();
  }

  Future<List<SongModel>> _loadSongs() async {
    final String jsonString = await rootBundle
        .loadString('assets/data/songs.json');
    return songModelFromJson(jsonString);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildFeaturedArtists(
    AppLocalizations l10n,
  ) {
    return FutureBuilder<List<Artist>>(
      future: _artistsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
            ),
          );
        } else if (snapshot.hasData) {
          final artists = snapshot.data!;
          if (artists.isEmpty) {
            return const SizedBox.shrink();
          }
          return Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Text(
                  l10n.featuredArtists,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height:
                    140, // Increased height to accommodate text
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal,
                  itemCount: artists.length,
                  itemBuilder: (context, index) {
                    final artist = artists[index];
                    return Container(
                      width:
                          100, // Fixed width for each item
                      margin:
                          const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage(
                                  artist.imageUrl,
                                ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            artist.name,
                            textAlign:
                                TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow
                                .ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('No artists found'),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 32, 234, 120),
            Color.fromARGB(255, 98, 234, 141),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 15.0,
          title: Text(
            l10n.home_songs,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
              54.0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText:
                      l10n.button_search_song,
                  hintStyle: const TextStyle(
                    color: secondaryColor,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Text(
                    l10n.trending,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.purple,
                  unselectedLabelColor:
                      Colors.grey,
                  tabs: [
                    Tab(text: l10n.hotThisWeek),
                    Tab(text: l10n.forYou),
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: FutureBuilder<List<SongModel>>(
                    future: _songsFuture,
                    builder: (context, snapshot) {
                      if (snapshot
                              .connectionState ==
                          ConnectionState
                              .waiting) {
                        return const Center(
                          child:
                              CircularProgressIndicator(),
                        );
                      } else if (snapshot
                          .hasError) {
                        return Center(
                          child: Text(
                            'Error: ${snapshot.error}',
                          ),
                        );
                      } else if (snapshot
                          .hasData) {
                        final songs =
                            snapshot.data!;
                        return TabBarView(
                          controller:
                              _tabController,
                          children: [
                            ListView.builder(
                              scrollDirection:
                                  Axis.horizontal,
                              itemCount:
                                  songs.length,
                              itemBuilder:
                                  (
                                    context,
                                    index,
                                  ) {
                                    return MediaCard(
                                      item:
                                          songs[index],
                                      width: 220,
                                    );
                                  },
                            ),
                            ListView.builder(
                              scrollDirection:
                                  Axis.horizontal,
                              itemCount:
                                  songs.length,
                              itemBuilder:
                                  (
                                    context,
                                    index,
                                  ) {
                                    return MediaCard(
                                      item:
                                          songs[index],
                                      width: 220,
                                    );
                                  },
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'No songs found',
                          ),
                        );
                      }
                    },
                  ),
                ),

                _buildFeaturedArtists(l10n),
                _buildLatestSongs(l10n),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Text(
                    l10n.discoverGenres,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      _buildGenreChip(
                        l10n.pop,
                        Colors.blue,
                      ),
                      _buildGenreChip(
                        l10n.rock,
                        Colors.red,
                      ),
                      _buildGenreChip(
                        l10n.hipHopRap,
                        Colors.orange,
                      ),
                      _buildGenreChip(
                        l10n.rnb,
                        Colors.green,
                      ),
                      _buildGenreChip(
                        l10n.jazz,
                        Colors.purple,
                      ),
                      _buildGenreChip(
                        l10n.blues,
                        Colors.indigo,
                      ),
                      _buildGenreChip(
                        l10n.edm,
                        Colors.teal,
                      ),
                      _buildGenreChip(
                        l10n.country,
                        Colors.brown,
                      ),
                      _buildGenreChip(
                        l10n.reggae,
                        Colors.amber,
                      ),
                      _buildGenreChip(
                        l10n.classical,
                        Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenreChip(
    String label,
    Color color,
  ) {
    return Chip(
      label: Text(label),
      backgroundColor: color.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: color),
      ),
    );
  }

  Widget _buildLatestSongs(
    AppLocalizations l10n,
  ) {
    return FutureBuilder<List<SongModel>>(
      future: _songsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
            ),
          );
        } else if (snapshot.hasData) {
          final songs = snapshot.data!;
          if (songs.isEmpty) {
            return const SizedBox.shrink();
          }
          return Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Text(
                  l10n.latestSongs,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                            15.0,
                          ),
                    ),
                    margin:
                        const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlaySongsScreen(
                                  song: song,
                                ),
                          ),
                        );
                      },
                      leading: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(
                              8.0,
                            ),
                        child: Image.asset(
                          song.imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(song.title),
                      subtitle: Text(song.artist),
                      trailing: Row(
                        mainAxisSize:
                            MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons
                                .remove_red_eye_outlined,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(song.views),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('No songs found'),
          );
        }
      },
    );
  }
}
