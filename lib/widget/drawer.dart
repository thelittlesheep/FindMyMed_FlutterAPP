import 'package:flutter/material.dart';
import 'package:frametest/models/user.dart';
import 'package:frametest/routes/Routes.dart';
import 'package:frametest/services/database.dart';
import 'package:frametest/widget/loading.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            userData.name + ' , 您好!',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          ClipOval(
                              child: Image.asset("assets/profile.jpg",
                                  scale: 8.0)),
                          // CircleAvatar(
                          //   child: Text('Avatar'),
                          //   backgroundImage: AssetImage('assets/profile.jpg'),
                          //   radius: 40.0,
                          // )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      )),
                  _createDrawerItem(
                      icon: Icons.person,
                      text: '個人基本資料',
                      onTap: () => {
                            Navigator.pop(context),
                            Navigator.pushNamed(context, Routes.profile)
                          }),
                  _createDrawerItem(
                      icon: Icons.local_hospital,
                      text: '個人藥物/食物資料',
                      onTap: () => {
                            Navigator.pop(context),
                            Navigator.pushNamed(context, Routes.medandfood)
                          }),
                  _createDrawerItem(
                      icon: Icons.report,
                      text: '交互作用警示',
                      onTap: () => {
                            Navigator.pop(context),
                            Navigator.pushNamed(context, Routes.interaction)
                          }),
                  // _createDrawerItem(
                  //     icon: Icons.search,
                  //     text: '藥品搜尋',
                  //     onTap: () => {
                  //           Navigator.pop(context),
                  //           Navigator.pushNamed(context, Routes.search)
                  //         }),
                  // Divider(),
                  // _createDrawerItem(
                  //     icon: Icons.settings,
                  //     text: '設定',
                  //     onTap: () => {
                  //           Navigator.pop(context),
                  //           Navigator.pushNamed(context, Routes.setting)
                  //         }),
                  _createDrawerItem(
                      icon: Icons.info,
                      text: '關於',
                      onTap: () => {
                            Navigator.pop(context),
                            Navigator.pushNamed(context, Routes.about)
                          }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

Widget _createDrawerItem(
    {IconData icon,
    String text,
    GestureTapCallback onTap,
    routes,
    BuildContext context}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
