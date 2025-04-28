import 'package:shared_preferences/shared_preferences.dart';

enum PrefsKey {
  email,
}

class PrefsHelper {
  static late SharedPreferences prefs;

  static Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setString({required PrefsKey key, required String value}) {
    prefs.setString(key.name, value);
  }

  static getString({required PrefsKey key}) {
    return prefs.getString(key.name);
  }
}
