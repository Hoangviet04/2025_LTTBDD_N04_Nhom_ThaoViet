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
    final dynamic doneValue = json["done"];
    final bool doneBool = (doneValue is bool) ? doneValue : false;
    return StreakDay(day: json["day"], done: doneBool);
  }
}

List<UserDataModel> userModelFromJson(String str) {
  final dynamic decoded = json.decode(str);

  final List<dynamic> jsonData;
  if (decoded is List) {
    jsonData = decoded;
  } else if (decoded is Map) {
    jsonData = [decoded];
  } else {
    throw FormatException('Unexpected JSON structure for user data');
  }

  final List<UserDataModel> userDataList = jsonData.map((item) {
    return UserDataModel.fromJson(Map<String, dynamic>.from(item));
  }).toList();
  return userDataList;
}
