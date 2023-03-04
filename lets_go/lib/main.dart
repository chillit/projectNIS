import 'package:flutter/material.dart';
import 'package:lets_go/screens/FabTabs.dart';
import 'package:lets_go/screens/Login.dart';
import 'package:lets_go/screens/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lets_go/shared_prefs.dart';
bool isSigned = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if(prefs.containsKey('isSigned') == false) {
    prefs.setBool('isSigned', false);
  }
  
  isSigned = prefs.getBool('isSigned')!;

  print("started");
  SharedPrefs().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: isSigned ? '/' : '/register',
      routes: {
        '/': (context) => FabTabs(selectedIndex: 0),
        '/register': (context) => Register(),
        '/login': (context) => Login(),
      },
    );
  }
}