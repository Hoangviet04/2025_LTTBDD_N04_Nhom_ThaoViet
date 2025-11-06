import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'dart:convert';
import 'package:vibeng/theme.dart';
import 'package:vibeng/screens/team_info_screen.dart';
import 'package:flutter/services.dart' show rootBundle;

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final String response = await rootBundle.loadString(
      'assets/data/steaks.json',
    );
    final data = await json.decode(response);
    setState(() {
      _username = data['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'assets/imgs/anh_bia.jpg',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: -53.33,
                child: CircleAvatar(
                  radius: 84,
                  backgroundColor: Colors.white,
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/imgs/takopi_bia.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 69.33),
          Text(
            _username,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeamInfoScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.group),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(AppLocalizations.of(context)!.teamInfo),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // đăng xuất
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(width: 8),
                  Text(AppLocalizations.of(context)!.logout),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
