import 'dart:convert';

class UserDataModel {
  String username;
  int streak;
  List<StreakDay> streakDays;
  int reviewCount;

  UserDataModel({
    required this.username,
    required this.streak,
    required this.streakDays,
    required this.reviewCount,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      username: json["username"],
      streak: json["streak"],
      streakDays: List<StreakDay>.from(
        json["streakDays"].map((x) => StreakDay.fromJson(x)),
      ),
      reviewCount: json["reviewCount"],
    );
  }
}

class StreakDay {
  String day;
  bool done;

  StreakDay({required this.day, required this.done});

  factory StreakDay.fromJson(Map<String, dynamic> json) {
    return StreakDay(day: json["day"], done: json["done"]);
  }
}

List<UserDataModel> userModelFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  final List<UserDataModel> userDataList = jsonData.map((item) {
    return UserDataModel.fromJson(item);
  }).toList();
  return userDataList;
}
