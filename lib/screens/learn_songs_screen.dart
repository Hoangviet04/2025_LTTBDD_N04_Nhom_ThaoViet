import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';

class LearnSongsScreen extends StatelessWidget {
  const LearnSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.home_songs)),
      body: Center(
        child: Text(
          l10n.home_songs,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
