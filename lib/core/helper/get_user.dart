import 'dart:convert';

import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/services/shared_pref.dart';
import 'package:fruit_app/features/Auth/data/model/user_model.dart';

UserModel getUser() {
  final userJson = SharedPref.getString(kSaveData);
  if (userJson.trim().isEmpty) {
    return UserModel(email: '', name: '', uId: '');
  }
  try {
    final data = jsonDecode(userJson);
    return UserModel.fromJson(data);
  } catch (e) {
    print("Error parsing user JSON: $e");
    return UserModel(email: '', name: '', uId: '');
  }
}
