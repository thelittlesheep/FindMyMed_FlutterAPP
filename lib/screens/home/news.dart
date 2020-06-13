import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/widget/TitleTextItem.dart';

class News extends StatelessWidget {
  const News({Key key, @required this.title, @required this.color,@required this.textdata})
      : super(key: key);

  final String title;
  final List textdata;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(width: 0.3, color: Colors.white),
      ),
      elevation: 5.0,
      child: Container(
          padding: const EdgeInsets.all(15.0),
          alignment: Alignment.centerLeft,
          child: Column(
            children: <Widget>[
              CreatTilteTextItem(title),
              Divider(
                height: 10.0,
                thickness: 1.5,
                color: Colors.black,
              ),
              Container(
                // padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var i in textdata) IcnoandText(text: i.toString(),)
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class IcnoandText extends StatelessWidget {
  const IcnoandText({
    Key key,
    @required this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.error),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 19.0),
              softWrap: true,
            ),
          ),
        )
      ],
    );
  }
}
