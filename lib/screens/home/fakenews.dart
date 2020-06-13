import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/widget/TitleTextItem.dart';
import 'package:google_fonts/google_fonts.dart';

class FakeNews extends StatelessWidget {
  const FakeNews(
      {Key key,
      @required this.title,
      @required this.color,
      @required this.textdata})
      : super(key: key);

  final String title;
  final Color color;
  final List textdata;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(15.0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          CreatTilteTextItem(title),
          Divider(
            height: 10.0,
            thickness: 1.5,
            color: Colors.black,
          ),
          for (var i in textdata)
            IconTextCard(
              color: color,
              text: i.toString(),
            )
        ],
      ),
    );
  }
}

class IconTextCard extends StatelessWidget {
  const IconTextCard({
    Key key,
    @required this.color,
    @required this.text,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(3.0),
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(width: 0.3, color: Colors.white)),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.error),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 18),
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
