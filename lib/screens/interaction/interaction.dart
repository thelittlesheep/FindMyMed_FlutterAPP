import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/screens/interaction/interaction_preview.dart';
import 'package:frametest/widget/drawer.dart';

class InteractionPage extends StatefulWidget {
  static const String routeName = '/InteractionPage';
  @override
  _InteractionPageState createState() => _InteractionPageState();
}

class _InteractionPageState extends State<InteractionPage> {

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
            appBar: AppBar(title: Text('交互作用'),),
            body: InteractionPreview()
        )
      )
    );
  }

}