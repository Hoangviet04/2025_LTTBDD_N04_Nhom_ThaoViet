import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';

class MemberDetailScreen extends StatelessWidget {
  final String name;
  final String imagePath;
  final String studentId;
  final String phone;
  final String email;
  final String address;
  final String role;

  const MemberDetailScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.studentId,
    required this.phone,
    required this.email,
    required this.address,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          CircleAvatar(
            radius: 82,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                imagePath,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.person,
                  text: '${AppLocalizations.of(context)!.studentId}: $studentId',
                ),
                _InfoRow(
                  icon: Icons.phone,
                  text: '${AppLocalizations.of(context)!.phoneNumber}: $phone',
                ),
                _InfoRow(
                  icon: Icons.email,
                  text: '${AppLocalizations.of(context)!.email}: $email',
                ),
                _InfoRow(
                  icon: Icons.location_on,
                  text: '${AppLocalizations.of(context)!.address}: $address',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
