import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context)!.bottomNavBarHome,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: AppLocalizations.of(context)!.bottomNavBarDictionary,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: AppLocalizations.of(context)!.bottomNavBarActivity,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppLocalizations.of(context)!.bottomNavBarUser,
        ),
      ],
    );
  }
}
