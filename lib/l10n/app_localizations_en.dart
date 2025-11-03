// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get bottomNavBarHome => 'Home';

  @override
  String get bottomNavBarDictionary => 'Word Store';

  @override
  String get bottomNavBarActivity => 'Activity';

  @override
  String get bottomNavBarUser => 'User';

  @override
  String get userScreenTitle => 'User Information';

  @override
  String get userScreenStudentID => 'ID';

  @override
  String get userScreenRole => 'Role';

  @override
  String get home_seeMore => 'See more';

  @override
  String get home_learnThrough => 'Learn Through';

  @override
  String get home_streakProgress => 'Streak & Progress';

  @override
  String get home_reviewToday => 'Review Today';

  @override
  String home_hello(String username) {
    return 'Hello $username,';
  }

  @override
  String get home_greeting => 'Good morning!';

  @override
  String get home_songs => 'Songs';

  @override
  String get home_videos => 'Videos';

  @override
  String get home_vocabSet => 'Vocab Set';

  @override
  String get home_shortFilms => 'Short Films';

  @override
  String get home_podcasts => 'Podcasts';

  @override
  String get home_news => 'News';

  @override
  String get home_streakMessage => 'Keep your streak going!';

  @override
  String get home_streakDetail => 'Day streak';

  @override
  String get home_todayTask => 'Today\'s Task';

  @override
  String get home_startButton => 'Start';

  @override
  String get home_reviewMessage => 'No words to review today';

  @override
  String get home_hotWordsToday => 'Hot Words Today';

  @override
  String get home_error => 'Error loading data';

  @override
  String get button_search_video => 'Search video, topic';

  @override
  String get video_hot_list_title => 'Trending';

  @override
  String get num_lessons => 'number of lessons';

  @override
  String get video_topic_all => 'Learning by topics';

  @override
  String get video_topic_news => 'News';

  @override
  String get video_topic_travel_culture => 'Travel & Culture';

  @override
  String get video_topic_short_films => 'Short Films';

  @override
  String get video_topic_podcast => 'Podcast';

  @override
  String get video_topic_history => 'History';

  @override
  String get video_topic_food_lifestyle => 'Food & Lifestyle';

  @override
  String get video_topic_health => 'Health';
}
