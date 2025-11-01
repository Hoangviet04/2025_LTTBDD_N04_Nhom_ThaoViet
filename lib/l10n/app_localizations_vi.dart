// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get helloWorld => 'Chào thế giới!';

  @override
  String get bottomNavBarHome => 'Trang chủ';

  @override
  String get bottomNavBarDictionary => 'Kho từ';

  @override
  String get bottomNavBarActivity => 'Hoạt động';

  @override
  String get bottomNavBarUser => 'Thành viên';

  @override
  String get userScreenTitle => 'Thông tin thành viên';

  @override
  String get userScreenStudentID => 'MSSV';

  @override
  String get userScreenRole => 'Chức vụ';

  @override
  String get home_seeMore => 'Xem thêm';

  @override
  String get home_learnThrough => 'Học qua';

  @override
  String get home_streakProgress => 'Chuỗi ngày & Tiến độ';

  @override
  String get home_reviewToday => 'Ôn tập hôm nay';

  @override
  String home_hello(String username) {
    return 'Xin chào $username,';
  }

  @override
  String get home_greeting => 'Chúc một ngày tốt lành!';

  @override
  String get home_songs => 'Bài hát';

  @override
  String get home_videos => 'Video';

  @override
  String get home_vocabSet => 'Bộ từ vựng';

  @override
  String get home_shortFilms => 'Phim ngắn';

  @override
  String get home_podcasts => 'Podcast';

  @override
  String get home_news => 'Tin tức';

  @override
  String get home_streakMessage => 'Tiếp tục duy trì chuỗi ngày của bạn!';

  @override
  String get home_streakDetail => 'Ngày liên tiếp';

  @override
  String get home_todayTask => 'Nhiệm vụ hôm nay';

  @override
  String get home_startButton => 'Bắt đầu';

  @override
  String get home_reviewMessage => 'Không có từ nào cần ôn tập hôm nay';

  @override
  String get home_hotWordsToday => 'Từ nóng hôm nay';

  @override
  String get home_error => 'Lỗi tải dữ liệu';
}
