import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vibeng/models/song_model.dart';

class PlaySongsScreen extends StatefulWidget {
  final SongModel song;

  const PlaySongsScreen({
    super.key,
    required this.song,
  });

  @override
  State<PlaySongsScreen> createState() =>
      _PlaySongsScreenState();
}

class _PlaySongsScreenState
    extends State<PlaySongsScreen> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(
      context,
    ).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.song.imageUrl,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
              color: Colors.black.withOpacity(
                0.3,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.4],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height:
                    kToolbarHeight +
                    MediaQuery.of(
                      context,
                    ).padding.top,
              ),
              Container(
                height: screenHeight * 0.4,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(
                            15.0,
                          ),
                      child: Image.asset(
                        widget.song.imageUrl,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.song.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.song.artist,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'Lyrics',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'This is where the lyrics will be displayed. '
                          'Currently, it is a placeholder.',
                          textAlign:
                              TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: Column(
                  children: [
                    Slider(
                      value: 0.0,
                      onChanged: (value) {},
                      min: 0.0,
                      max: 100.0,
                      activeColor: Colors.white,
                      inactiveColor:
                          Colors.white30,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: const [
                          Text(
                            '0:00',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '3:30',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.skip_previous,
                            size: 36,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            isPlaying
                                ? Icons
                                      .pause_circle_filled
                                : Icons
                                      .play_circle_filled,
                            size: 64,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isPlaying =
                                  !isPlaying;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.skip_next,
                            size: 36,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
