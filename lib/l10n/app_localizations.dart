import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @bottomNavBarHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavBarHome;

  /// No description provided for @bottomNavBarDictionary.
  ///
  /// In en, this message translates to:
  /// **'Word Store'**
  String get bottomNavBarDictionary;

  /// No description provided for @bottomNavBarActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get bottomNavBarActivity;

  /// No description provided for @bottomNavBarUser.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get bottomNavBarUser;

  /// No description provided for @userScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'User Information'**
  String get userScreenTitle;

  /// No description provided for @userScreenStudentID.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get userScreenStudentID;

  /// No description provided for @userScreenRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get userScreenRole;

  /// No description provided for @home_seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get home_seeMore;

  /// No description provided for @home_learnThrough.
  ///
  /// In en, this message translates to:
  /// **'Learn Through'**
  String get home_learnThrough;

  /// No description provided for @home_streakProgress.
  ///
  /// In en, this message translates to:
  /// **'Streak & Progress'**
  String get home_streakProgress;

  /// No description provided for @home_reviewToday.
  ///
  /// In en, this message translates to:
  /// **'Review Today'**
  String get home_reviewToday;

  /// No description provided for @home_hello.
  ///
  /// In en, this message translates to:
  /// **'Hello {username},'**
  String home_hello(String username);

  /// No description provided for @home_greeting.
  ///
  /// In en, this message translates to:
  /// **'Good morning!'**
  String get home_greeting;

  /// No description provided for @home_songs.
  ///
  /// In en, this message translates to:
  /// **'Songs'**
  String get home_songs;

  /// No description provided for @home_videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get home_videos;

  /// No description provided for @home_vocabSet.
  ///
  /// In en, this message translates to:
  /// **'Vocab Set'**
  String get home_vocabSet;

  /// No description provided for @home_shortFilms.
  ///
  /// In en, this message translates to:
  /// **'Short Films'**
  String get home_shortFilms;

  /// No description provided for @home_podcasts.
  ///
  /// In en, this message translates to:
  /// **'Podcasts'**
  String get home_podcasts;

  /// No description provided for @home_news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get home_news;

  /// No description provided for @home_streakMessage.
  ///
  /// In en, this message translates to:
  /// **'Keep your streak going!'**
  String get home_streakMessage;

  /// No description provided for @home_streakDetail.
  ///
  /// In en, this message translates to:
  /// **'Day streak'**
  String get home_streakDetail;

  /// No description provided for @home_todayTask.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Task'**
  String get home_todayTask;

  /// No description provided for @home_startButton.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get home_startButton;

  /// No description provided for @home_reviewMessage.
  ///
  /// In en, this message translates to:
  /// **'No words to review today'**
  String get home_reviewMessage;

  /// No description provided for @home_hotWordsToday.
  ///
  /// In en, this message translates to:
  /// **'Hot Words Today'**
  String get home_hotWordsToday;

  /// No description provided for @home_error.
  ///
  /// In en, this message translates to:
  /// **'Error loading data'**
  String get home_error;

  /// No description provided for @teamInfo.
  ///
  /// In en, this message translates to:
  /// **'Team Info'**
  String get teamInfo;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @teamLead.
  ///
  /// In en, this message translates to:
  /// **'Team Lead'**
  String get teamLead;

  /// No description provided for @member.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get member;

  /// No description provided for @studentId.
  ///
  /// In en, this message translates to:
  /// **'Student ID'**
  String get studentId;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneNumber;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
