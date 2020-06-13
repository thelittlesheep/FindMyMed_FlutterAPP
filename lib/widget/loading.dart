import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffff94c2),
      child: Center(
        child: SpinKitChasingDots(
          color: Color(0xfff06292),
          size: 50.0,
        ),
      ),
    );
  }
}