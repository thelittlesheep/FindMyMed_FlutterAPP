import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/widget/drawer.dart';

class SettingPage extends StatefulWidget {
  static const String routeName = '/SettingPage';
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
        return null;
      },
      child: SafeArea(
        child: Scaffold(
            drawer: AppDrawer(),
            appBar: AppBar(title: Text('設定'),),
            body: Center(
                child: Container(
                  child: Text('Hello,this is setting page.',textAlign: TextAlign.center,),
                )
            )
        )
      )
    );
  }
}
