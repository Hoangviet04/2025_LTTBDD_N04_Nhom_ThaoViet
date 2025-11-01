import 'package:flutter/services.dart';
import 'package:vibeng/models/user_model.dart';

class UserRepository {
  Future<List<UserDataModel>> getUserData() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/steaks.json',
    );
    return userModelFromJson(jsonString);
  }
}
