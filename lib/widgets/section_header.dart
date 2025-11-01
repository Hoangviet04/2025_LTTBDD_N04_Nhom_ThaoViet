import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/theme.dart';

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
    final textTheme = Theme.of(context).textTheme.headlineLarge;

    return Padding(
      padding: defaultPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme),
          if (showSeeMore)
            TextButton(
              onPressed: onSeeMore,
              child: Text(
                AppLocalizations.of(context)!.home_seeMore.toUpperCase(),
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
        ],
      ),
    );
  }
}
