import 'package:get_storage/get_storage.dart';

class SharedPref {
  static GetStorage userBox = GetStorage('userBox');

  void addUserBox(String key, dynamic value) {
    userBox.write(key, value);
  }

  static String? getToken() {
    return userBox.read("user_id");
  }
}
