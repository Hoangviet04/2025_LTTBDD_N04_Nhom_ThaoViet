import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'theme.dart';
import 'widgets/bottom_navbar.dart';
import 'screens/home_screen.dart';
import 'screens/vocab_store_screen.dart';
import 'screens/activity_screen.dart';
import 'screens/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context
          .findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('vi');
  Locale get locale => _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const VocabStoreScreen(),
    const ActivityScreen(),
    const UserScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      locale: _locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:
          AppLocalizations.supportedLocales,
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
