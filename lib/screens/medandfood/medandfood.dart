import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/screens/medandfood/medandfood_preview.dart';
import 'package:frametest/widget/drawer.dart';

class MedandFoodPage extends StatefulWidget {
  static const String routeName = '/MedandFoodPage';
  @override
  _MedandFoodPageState createState() => _MedandFoodPageState();
}

class _MedandFoodPageState extends State<MedandFoodPage> {
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
            title: Text('個人藥物/食物資料'),
          ),
          body: MedandFoodPreview(),
        )));
  }
}
