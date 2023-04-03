import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  clear() {
    _sharedPrefs?.clear();
  }

  bool get isSigned => _sharedPrefs!.getBool('isSigned')!;

  set isSigned(bool value) {
    _sharedPrefs?.setBool('isSigned', value);
  }

  String get username => _sharedPrefs!.getString('username')!;

  set username(String value) {
    _sharedPrefs?.setString('username', value);
  }

  String get email => _sharedPrefs!.getString('email')!;

  set email(String value) {
    _sharedPrefs?.setString('email', value);
  }

  SharedPrefs._internal();

  static SharedPrefs sPrefs = SharedPrefs._internal();

  factory SharedPrefs() => sPrefs;
}
