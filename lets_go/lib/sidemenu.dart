import 'package:lets_go/screens/FabTabs.dart';
import 'package:flutter/material.dart';

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
          DrawerHeader(
            child: Text('DevHubSpot', style: TextStyle(color: Colors.white, fontSize: 25)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1.0),
                  bottomRight: Radius.circular(1.0),
                ),
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/bg.jpeg')
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Home"),
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FabTabs(selectedIndex:0)))
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FabTabs(selectedIndex:1)))
            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin_outlined),
            title: Text("Team"),
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FabTabs(selectedIndex:2)))
            },
          ),
          ListTile(
            leading: Icon(Icons.more_horiz_outlined),
            title: Text("More"),
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FabTabs(selectedIndex:3)))
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Register"),
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FabTabs(selectedIndex:4)))
            },
          )
        ],
      ),
    );
  }
}