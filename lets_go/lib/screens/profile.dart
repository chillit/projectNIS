import 'package:lets_go/sidemenu.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _HomeState();
}

class _HomeState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'PROFILE',style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}