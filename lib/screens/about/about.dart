import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/screens/about/about1.dart';
import 'package:frametest/widget/drawer.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = '/AboutPage';
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          return null;
        },
        child: SafeArea(
            child: Scaffold(
          drawer: AppDrawer(),
          appBar: AppBar(
            title: Text('搜尋結果'),
          ),
          body: about1(),
        )));
  }

  Widget createItem(String contentText) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(contentText),
    );
  }

  List<Widget> createList() {
    List<Widget> widgets = [];

    for (int index = 1; index <= 100; index++) {
      widgets.add(createItem('Text $index'));
    }

    return widgets;
  }
}
