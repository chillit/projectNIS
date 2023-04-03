import 'package:firebase_auth/firebase_auth.dart';
import 'package:lets_go/screens/Register.dart';
import 'package:lets_go/screens/quiz/home.dart';
import 'package:lets_go/screens/more.dart';
import 'package:lets_go/screens/profile.dart';
import 'package:lets_go/screens/team.dart';
import 'package:flutter/material.dart';
import 'package:lets_go/screens/Play.dart';
import 'package:lets_go/Auth.dart';

class Fabs extends StatelessWidget {
  Fabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FabTabs(selectedIndex: 0);
          } else {
            return Auth();
          }
        });
  }
}

class FabTabs extends StatefulWidget {
  int selectedIndex = 0;

  FabTabs({required this.selectedIndex});

  @override
  State<FabTabs> createState() => _FabTabsState();
}

class _FabTabsState extends State<FabTabs> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      currentIndex = widget.selectedIndex;
    });
  }

  @override
  void initState() {
    onItemTapped(widget.selectedIndex);
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> pages = [Home(), MyProfileScreen(), Team(), More()];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0
        ? Home()
        : currentIndex == 1
            ? MyProfileScreen()
            : currentIndex == 2
                ? Team()
                : currentIndex == 3
                    ? More()
                    : Play();
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        //backgroundColor: Colors.purple,
        child: Icon(Icons.play_arrow_sharp),
        onPressed: () {
          setState(() {
            currentScreen = Play();
            currentIndex = 5;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Home();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: currentIndex == 0
                              ? Colors.pinkAccent
                              : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? Colors.pinkAccent
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = MyProfileScreen();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentIndex == 1
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: currentIndex == 1
                                  ? Colors.blueAccent
                                  : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Team();
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_pin_outlined,
                          color: currentIndex == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Team",
                          style: TextStyle(
                              color: currentIndex == 2
                                  ? Colors.blue
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = More();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.more_horiz_outlined,
                          color: currentIndex == 3
                              ? Colors.orangeAccent
                              : Colors.grey,
                        ),
                        Text(
                          "More",
                          style: TextStyle(
                              color: currentIndex == 3
                                  ? Colors.orangeAccent
                                  : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
