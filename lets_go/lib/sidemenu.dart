import 'package:lets_go/screens/FabTabs.dart';
import 'package:flutter/material.dart';
import 'package:lets_go/shared_prefs.dart';

import 'constans.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FabTabs(selectedIndex: 1)));
              },
              child: DrawerHeader(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    //bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: kPrimaryColor,
                  /*image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage('assets/bg.jpeg')
                    )*/
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/MAIN CHARECTER1.png'),
                    ),
                    kWidthSizedBox,
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          SharedPrefs().username,
                          style: TextStyle(
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Home"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 0)))
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 1)))
            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin_outlined),
            title: Text("Team"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 2)))
            },
          ),
          ListTile(
            leading: Icon(Icons.more_horiz_outlined),
            title: Text("More"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 3)))
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/register', (route) => false);
              SharedPrefs().clear();
            },
          )
        ],
      ),
    );
  }
}
