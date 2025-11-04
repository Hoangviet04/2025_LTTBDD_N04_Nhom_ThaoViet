import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';

class VocabStoreScreen extends StatelessWidget {
  const VocabStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Text(
          l10n.vocab_store_title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
