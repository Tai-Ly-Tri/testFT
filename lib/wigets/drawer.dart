import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_ft/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  // const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/images/tai.png"),
                  ),
                  accountName: Text("Tai", textScaleFactor: 1.2),
                  accountEmail: Text("tai@gmail.com"),
                )
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Ca nhan",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.arrow_turn_down_left,
                color: Colors.white,
              ),
              title: Text(
                "Dang xuat",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.loginRoutes);
              },
            ),
          ],
        ),
      ),
    );
  }
}
