import 'package:flutter/material.dart';

class CreatTilteTextItem extends StatelessWidget {
  final String text;

  CreatTilteTextItem(this.text);

  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 5.0),
        child: new Text(
          '$text',
          style: TextStyle(fontSize: 28.0),
        ));
  }
}
