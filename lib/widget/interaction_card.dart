import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/models/medandfood_modle.dart';
import 'TitleTextItem.dart';

class InteractionCard extends StatelessWidget {
  const InteractionCard({
    Key key,
    @required this.title,
    @required this.color,
    @required this.data,
    @required this.data2,
  }) : super(key: key);

  final String title;
  final Color color;
  final List data;
  final MainInfo data2;

  @override
  Widget build(BuildContext context) {
    // return Card(
      // color: color,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(5.0),
      //     side: BorderSide(width: 0.3, color: Colors.white)),
      // elevation: 5.0,
      // margin: EdgeInsets.all(20.0),
      return Container(
        // padding: const EdgeInsets.all(5.0),
        alignment: Alignment.centerLeft,
        // color: color,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CreatTilteTextItem(title),
            Divider(
              height: 10.0,
              thickness: 1.5,
              color: Colors.black,
            ),
            Container(
                padding: EdgeInsets.only(left: 5.0),
                // color: Colors.yellowAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var i = 0; i < data.length; i++)
                      Card(
                        color: Colors.lightBlue[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(width: 0.3, color: Colors.white)),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    ((i + 1).toString() + '.' + data[i]),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(data2.chinesemedinteractiondescribe),
                                  Text(data2.foodinteractiondescribe)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            )
                          ],
                        ),
                      )
                  ],
                )),
          ],
        ),
      );
    // );
  }
}
