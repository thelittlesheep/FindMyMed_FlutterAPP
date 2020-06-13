import 'package:flutter/material.dart';
import 'package:frametest/screens/search/search_preview.dart';
import 'package:frametest/widget/drawer.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/SearchPage';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
            title: Text('藥品搜尋'),
          ),
          body: searchPreview(),
        )));
  }
}
