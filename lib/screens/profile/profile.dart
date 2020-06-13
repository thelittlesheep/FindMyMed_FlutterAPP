import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/screens/profile/profile_preview.dart';
import 'package:frametest/widget/drawer.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profileEditing';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          return;
        },
        child: SafeArea(
            child: Scaffold(
                drawer: AppDrawer(),
                appBar: AppBar(
                  title: Text('個人基本資料'),
                ),
                body: Container(
                  height: double.maxFinite,
                  color: Colors.grey[300],
                  child: ProfilePreview(),
                ))));
  }
}
