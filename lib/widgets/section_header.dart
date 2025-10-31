import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showSeeMore;
  final VoidCallback? onSeeMore;

  const SectionHeader({
    super.key,
    this.title = '',
    this.showSeeMore = false,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.titleLarge),
          if (showSeeMore)
            TextButton(
              onPressed: onSeeMore,
              child: Text(
                AppLocalizations.of(context)!.home_seeMore.toUpperCase(),
                style: TextStyle(color: colorScheme.primary),
              ),
            ),
        ],
      ),
    );
  }
}
