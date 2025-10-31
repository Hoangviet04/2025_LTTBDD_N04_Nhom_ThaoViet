import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin thành viên'),
        backgroundColor: Theme.of(
          context,
        ).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          MemberCard(
            imagePath: 'imgs/cat1.jpg',
            name: 'Nguyễn Thị Thu Thảo',
            studentId: '22010496',
            role: 'Trưởng nhóm',
          ),
          SizedBox(height: 16),
          MemberCard(
            imagePath: 'imgs/cat2.jpg',
            name: 'Đinh Hoàng Việt',
            studentId: '22010354',
            role: 'Thành viên',
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
    Key? key,
    required this.imagePath,
    required this.name,
    required this.studentId,
    required this.role,
  }) : super(key: key);

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
                  Text('MSSV: $studentId'),
                  const SizedBox(height: 4),
                  Text('Chức vụ: $role'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
