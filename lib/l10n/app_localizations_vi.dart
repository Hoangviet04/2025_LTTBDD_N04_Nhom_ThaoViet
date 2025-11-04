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
  String get bottomNavBarUser => 'Người dùng';

  @override
  String get userScreenTitle => 'Thông tài khoản';

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

  @override
  String get teamInfo => 'Thông tin nhóm';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get teamLead => 'Trưởng nhóm';

  @override
  String get member => 'Thành viên';

  @override
  String get studentId => 'MSSV';

  @override
  String get role => 'Vai trò';

  @override
  String get phoneNumber => 'SĐT';

  @override
  String get email => 'Email';

  @override
  String get address => 'Địa chỉ';

  @override
  String get button_search_video => 'Tìm video, chủ đề';

  @override
  String get button_search_song => 'Tìm kiếm bài hát hoặc nghệ sĩ';

  @override
  String get video_hot_list_title => 'Đang thịnh hành';

  @override
  String get num_lessons => 'lượt học';

  @override
  String get video_topic_all => 'Học theo chủ đề';

  @override
  String get video_topic_news => 'Tin tức';

  @override
  String get video_topic_travel_culture => 'Du lịch & Văn hóa';

  @override
  String get video_topic_short_films => 'Phim ngắn';

  @override
  String get video_topic_podcast => 'Podcast';

  @override
  String get video_topic_history => 'Lịch sử';

  @override
  String get video_topic_food_lifestyle => 'Ẩm thực & Lối sống';

  @override
  String get video_topic_health => 'Sức khỏe';

  @override
  String video_by_level_title(Object level) {
    return 'Video trình độ $level';
  }

  @override
  String get vocab_store_title => 'Kho từ';

  @override
  String get vocab_sets_title => 'Bộ từ vựng';

  @override
  String get vocab_sets_search_hint => 'Tìm bộ từ vựng';

  @override
  String get trending => 'Xu hướng 🔥';

  @override
  String get hotThisWeek => 'Hot trong tuần';

  @override
  String get forYou => 'Dành cho bạn';

  @override
  String get artist => 'Nghệ sĩ';

  @override
  String hotSongNumber(int number) {
    return 'Bài hát hot #$number';
  }

  @override
  String forYouSongNumber(int number) {
    return 'Bài hát cho bạn #$number';
  }

  @override
  String get views => 'lượt xem';

  @override
  String get lessons => 'lượt học';

  @override
  String get discoverGenres => 'Khám phá thể loại 🌈';

  @override
  String get pop => 'Nhạc Pop 🎧';

  @override
  String get rock => 'Nhạc Rock 📈';

  @override
  String get hipHopRap => 'Nhạc Hip-hop/Rap 🎤';

  @override
  String get rnb => 'Nhạc R&B 🌿';

  @override
  String get jazz => 'Nhạc Jazz 🎵';

  @override
  String get blues => 'Nhạc Blues 💙';

  @override
  String get edm => 'EDM 🏆';

  @override
  String get country => 'Nhạc Đồng Quê 🎶';

  @override
  String get reggae => 'Nhạc Reggae 🔷';

  @override
  String get classical => 'Nhạc Cổ Điển ⚡';
}
