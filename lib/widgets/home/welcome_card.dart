import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/user_model.dart';
import 'package:vibeng/repositories/user_repository.dart';
import 'package:vibeng/theme.dart';

class WelcomeCard extends StatefulWidget {
  const WelcomeCard({super.key});

  @override
  State<WelcomeCard> createState() => _WelcomeCardState();
}

class _WelcomeCardState extends State<WelcomeCard> {
  final UserRepository repository = UserRepository();
  List<UserDataModel>? userDataList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final data = await repository.getUserData();
    setState(() {
      userDataList = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (userDataList == null) {
      return Container(child: Text(l10n.home_error));
    } else {
      final userData = userDataList![0];
      return Container(
        padding: const EdgeInsets.all(20),
        margin: defaultMargin,
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
                  l10n.home_hello(userData.username),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.sunny, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      l10n.home_greeting,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: defaultPadding,
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
                  const SizedBox(width: 8),
                  const Text(
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
  }
}
