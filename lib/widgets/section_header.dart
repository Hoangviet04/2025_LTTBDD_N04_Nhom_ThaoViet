import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? icon;
  final bool showSeeMore;
  final VoidCallback? onSeeMore;

  const SectionHeader({
    super.key,
    this.title = '',
    this.icon,
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
          Row(
            children: [
              Text(title, style: textTheme),
              if (icon != null) ...[const SizedBox(width: 8), icon!],
            ],
          ),
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
