import 'package:flutter/material.dart';
import 'package:vibeng/models/word_detail_model.dart';
import 'package:vibeng/theme.dart';
import 'dart:math' as math;

class FlashcardScreen extends StatefulWidget {
  final List<WordDetailModel> vocabularies;

  const FlashcardScreen({super.key, required this.vocabularies});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  List<WordDetailModel> shuffledVocabularies = [];
  late final AnimationController _flipController;
  late final AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    shuffledVocabularies = List.from(widget.vocabularies)..shuffle();

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 0,
    )..addListener(() => setState(() {}));

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(begin: Offset.zero, end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
        );
  }

  @override
  void dispose() {
    _flipController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_flipController.value < 0.5) {
      _flipController.forward();
    } else {
      _flipController.reverse();
    }
  }

  Future<void> _animateSlide(bool isNext) async {
    _slideAnimation =
        Tween<Offset>(
          begin: Offset(isNext ? 1.0 : -1.0, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _slideController.reset();
    await _slideController.forward();
  }

  void _nextCard() async {
    setState(() {
      currentIndex = (currentIndex + 1) % shuffledVocabularies.length;
      _flipController.value = 0;
    });

    await _animateSlide(true);
  }

  void _previousCard() async {
    setState(() {
      currentIndex =
          (currentIndex - 1 + shuffledVocabularies.length) %
          shuffledVocabularies.length;
      _flipController.value = 0;
    });

    await _animateSlide(false);
  }

  @override
  Widget build(BuildContext context) {
    if (shuffledVocabularies.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Luyện tập flashcard'),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: const Center(child: Text('Không có từ vựng nào để luyện tập.')),
      );
    }

    final currentWord = shuffledVocabularies[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Luyện tập flashcard'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${currentIndex + 1} / ${shuffledVocabularies.length}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),

            SlideTransition(
              position: _slideAnimation,
              child: GestureDetector(
                onTap: _flipCard,
                child: _FlipCard(
                  progress: (currentIndex + 1) / shuffledVocabularies.length,
                  word: currentWord,
                  controllerValue: _flipController.value,
                ),
              ),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: _previousCard,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Trước'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: primaryColor,
                    side: BorderSide(color: primaryColor),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _nextCard,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Sau'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FlipCard extends StatelessWidget {
  final double progress;
  final WordDetailModel word;
  final double controllerValue;

  const _FlipCard({
    required this.progress,
    required this.word,
    required this.controllerValue,
  });

  @override
  Widget build(BuildContext context) {
    final angle = controllerValue * math.pi;
    final isFront = angle <= math.pi / 2;

    Widget buildFace(bool isFrontSide) {
      return Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 400,
          width: double.infinity,
          child: Column(
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                minHeight: 5,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isFrontSide) ...[
                        Text(
                          word.word,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                        ),

                        const SizedBox(height: 12),
                        Text(
                          word.pronunciation!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ] else ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: primaryColor.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            word.partOfSpeech!,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: primaryColor,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          word.meaning,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(color: Colors.black),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(color: primaryColor),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(angle),
      child: isFront
          ? buildFace(true)
          : Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: buildFace(false),
            ),
    );
  }
}
