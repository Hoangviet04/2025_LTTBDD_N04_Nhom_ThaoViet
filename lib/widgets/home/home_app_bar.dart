import 'package:flutter/material.dart';
import 'package:vibeng/main.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final myAppState = MyApp.of(context);
    final currentLocale = myAppState?.locale ?? const Locale('vi');

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Image.asset('assets/imgs/takopi_bia.png', height: 40),
          const SizedBox(width: 8),
          Text(
            "VocaMax",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => myAppState?.setLocale(const Locale('vi')),
                child: Text(
                  'VN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: currentLocale.languageCode == 'vi'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: currentLocale.languageCode == 'vi'
                        ? Colors.white
                        : Colors.white70,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                '|',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () => myAppState?.setLocale(const Locale('en')),
                child: Text(
                  'EN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: currentLocale.languageCode == 'en'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: currentLocale.languageCode == 'en'
                        ? Colors.white
                        : Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
