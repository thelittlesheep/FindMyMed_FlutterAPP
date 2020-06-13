import 'package:flutter/material.dart';
import 'package:frametest/models/user.dart';
import 'package:frametest/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:frametest/screens/login/autenticate.dart';


class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either HomePage or LoginPage widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}