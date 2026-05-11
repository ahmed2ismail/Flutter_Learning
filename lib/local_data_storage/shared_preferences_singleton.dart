import 'package:shared_preferences/shared_preferences.dart';
/*
  This class is a singleton that provides a convenient way to access SharedPreferences throughout the app.
  It initializes the SharedPreferences instance once and allows you to set and get values using static methods.

Prefs اختصار ل SharedPreferencesSingleton
وعشان تستخدم ال SharedPreferences في اي مكان في التطبيق بتحتاج تهيئة ال SharedPreferences مرة واحدة في بداية التطبيق وبعد كده تقدر تستخدم ال static methods اللي موجودة في ال Prefs class عشان تخزن وتجيب البيانات من SharedPreferences بسهولة بدون الحاجة لعمل instance جديد كل مرة.
initialize the SharedPreferences:
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Prefs.init();
runApp(MyApp());
}
*/

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    return await _instance.setBool(key, value);
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static Future<bool> setString({
    required String key,
    required String value,
  }) async {
    return await _instance.setString(key, value);
  }

  static String? getString(String key) {
    return _instance.getString(key);
  }

  static Future<bool> setInt({required String key, required int value}) async {
    return await _instance.setInt(key, value);
  }

  static int getInt(String key) {
    return _instance.getInt(key) ?? 0;
  }

  static Future<bool> setDouble({
    required String key,
    required double value,
  }) async {
    return await _instance.setDouble(key, value);
  }

  static double getDouble(String key) {
    return _instance.getDouble(key) ?? 0.0;
  }
}
