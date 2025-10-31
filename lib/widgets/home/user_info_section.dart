import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/user_model.dart';
import 'package:vibeng/repositories/user_repository.dart';
import 'package:vibeng/widgets/section_header.dart';

class UserInfoSection extends StatefulWidget {
  const UserInfoSection({super.key});
  @override
  _UserInfoSectionState createState() => _UserInfoSectionState();
}

class _UserInfoSectionState extends State<UserInfoSection> {
  final UserRepository _repository = UserRepository();
  late Future<List<UserDataModel>> _userDataFuture;

  @override
  void initState() {
    super.initState();
    _userDataFuture = _repository.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return FutureBuilder<List<UserDataModel>>(
      future: _userDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildSkeleton(context);
        }
        if (snapshot.hasError) {
          return Center(child: Text('Lỗi tải dữ liệu user: ${snapshot.error}'));
        }

        final userData = snapshot.data![0];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(context, l10n, userData.username),
            const SizedBox(height: 16),

            SectionHeader(title: l10n.home_learnThrough),
            _buildLearningGrid(context, l10n),
            const SizedBox(height: 16),

            SectionHeader(title: l10n.home_streakProgress),
            _buildStreakCard(context, l10n, userData),
            const SizedBox(height: 16),

            SectionHeader(title: l10n.home_reviewToday),
            _buildReviewCard(context, l10n, userData),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Widget _buildSkeleton(BuildContext context) {
    Widget skeletonBox(
      double height, {
      double width = double.infinity,
      double radius = 20,
    }) {
      return Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(radius),
        ),
      );
    }

    return Column(
      children: [
        skeletonBox(100),
        skeletonBox(20),
        skeletonBox(250),
        skeletonBox(20),
        skeletonBox(200),
        skeletonBox(20),
        skeletonBox(100),
      ],
    );
  }

  Widget _buildWelcomeCard(
    BuildContext context,
    AppLocalizations l10n,
    String username,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 229, 249, 252),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.home_hello(username),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.sunny, color: Colors.orange, size: 16),
                  SizedBox(width: 4),
                  Text(
                    l10n.home_greeting,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 0.8,
              ),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/UK.png', width: 24, height: 24),
                SizedBox(width: 8),
                Text(
                  "Tiếng Anh",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearningGrid(BuildContext context, AppLocalizations l10n) {
    final items = [
      _GridItem(l10n.home_songs, Icons.music_note, const Color(0xFFD6E4FF)),
      _GridItem(l10n.home_videos, Icons.videocam, const Color(0xFFFFD6D6)),
      _GridItem(l10n.home_vocabSet, Icons.book, const Color(0xFFE0D6FF)),
    ];

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: items.map((item) {
        return Container(
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 32, color: Colors.black.withOpacity(0.7)),
              const SizedBox(height: 12),
              Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStreakCard(
    BuildContext context,
    AppLocalizations l10n,
    UserDataModel userData,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "${userData.streak}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.home_streakMessage,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${l10n.home_streakDetail}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: userData.streakDays.map((day) {
                return Column(
                  children: [
                    Text(
                      day.day,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: day.done
                            ? Theme.of(context).primaryColor
                            : Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: day.done
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            )
                          : null,
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.home_todayTask,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Nút "Bắt đầu"
            ElevatedButton(
              onPressed: () {},
              child: Text(l10n.home_startButton),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(
    BuildContext context,
    AppLocalizations l10n,
    UserDataModel userData,
  ) {
    bool hasReview = userData.reviewCount > 0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              hasReview ? Icons.checklist_rtl : Icons.check_circle_outline,
              color: hasReview ? Colors.orange : Colors.green,
              size: 32,
            ),
            const SizedBox(width: 16),
            Text(
              hasReview
                  ? "${userData.reviewCount} từ cần ôn"
                  : l10n.home_reviewMessage,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridItem {
  final String title;
  final IconData icon;
  final Color color;
  _GridItem(this.title, this.icon, this.color);
}
