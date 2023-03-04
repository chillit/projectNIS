import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  bool get isSigned => _sharedPrefs!.getBool('isSigned')!;

  set isSigned(bool value) {
    _sharedPrefs?.setBool('isSigned', value);
  }

  String get username => _sharedPrefs!.getString('username')!;

  set username(String value) {
    _sharedPrefs?.setString('username', value);
  }

  SharedPrefs._internal();

  static SharedPrefs sPrefs = SharedPrefs._internal();

  factory SharedPrefs() => sPrefs;
}
