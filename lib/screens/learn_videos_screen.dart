import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';

class LearnVideosScreen extends StatelessWidget {
  const LearnVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.home_videos)),
      body: Center(
        child: Text(
          l10n.home_videos,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
