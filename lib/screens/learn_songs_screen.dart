import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/song_model.dart';
import 'package:vibeng/theme.dart';
import 'package:vibeng/widgets/media_card.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _songsFuture = _loadSongs();
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 111, 21, 222),
            Color.fromARGB(255, 118, 215, 235),
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
}
