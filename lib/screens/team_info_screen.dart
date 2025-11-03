import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/screens/member_detail_screen.dart';

class TeamInfoScreen extends StatelessWidget {
  const TeamInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.teamInfo),
        backgroundColor: Theme.of(
          context,
        ).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => Container(
                  height:
                      MediaQuery.of(
                        context,
                      ).size.height *
                      0.8,
                  child: MemberDetailScreen(
                    name: 'Nguyễn Thị Thu Thảo',
                    imagePath:
                        'assets/imgs/cat1.jpg',
                    studentId: '22010496',
                    phone: '0965201517',
                    email:
                        '22010496@st.phenikaa-uni.edu.vn',
                    address: 'Hưng Yên, Việt Nam',
                    role: AppLocalizations.of(context)!.teamLead,
                  ),
                ),
              );
            },
            child: MemberCard(
              imagePath: 'assets/imgs/cat1.jpg',
              name: 'Nguyễn Thị Thu Thảo',
              studentId: '22010496',
              role: AppLocalizations.of(context)!.teamLead,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => Container(
                  height:
                      MediaQuery.of(
                        context,
                      ).size.height *
                      0.8,
                  child: MemberDetailScreen(
                    name: 'Đinh Hoàng Việt',
                    imagePath:
                        'assets/imgs/cat2.jpg',
                    studentId: '22010354',
                    phone: '0396802204',
                    email:
                        '22010354@st.phenikaa-uni.edu.vn',
                    address: 'Hà Nội, Việt Nam',
                    role: AppLocalizations.of(context)!.member,
                  ),
                ),
              );
            },
            child: MemberCard(
              imagePath: 'assets/imgs/cat2.jpg',
              name: 'Đinh Hoàng Việt',
              studentId: '22010354',
              role: AppLocalizations.of(context)!.member,
            ),
          ),
        ],
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String studentId;
  final String role;

  const MemberCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.studentId,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) {
                      return const Icon(
                        Icons.person,
                        size: 80,
                      );
                    },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('${AppLocalizations.of(context)!.studentId}: $studentId'),
                  const SizedBox(height: 4),
                  Text('${AppLocalizations.of(context)!.role}: $role'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
