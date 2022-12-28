import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/clumpedVehicles_Page.dart';
import '../screens/home_page.dart';
import '../screens/signin_page.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('logo1.jpg'),
            ),
            accountName: Text('TEST_2'),
            accountEmail: Text('test2@email.com'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: (() {
              /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));*/
            }),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: (() {
              /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));*/
            }),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: (() {
              FirebaseAuth.instance.signOut().then((value) {
                print('Signed Out');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              });
            }),
          ),
        ]),
      ),
    );
  }
}
