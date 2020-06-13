import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TitleTextItem.dart';

class MedandFoodCard extends StatelessWidget {
  const MedandFoodCard({
    Key key,
    @required this.routepage,
    @required this.title,
    @required this.color,
    this.westmeddata,
    this.otherdata,
  }) : super(key: key);

  final String routepage;
  final String title;
  final Color color;
  final List westmeddata;
  final List otherdata;

  @override
  Widget build(BuildContext context) {
    if (westmeddata != null && otherdata == null) {
      return HasData(
          color: color, title: title, routepage: routepage, data: westmeddata);
    } else if (westmeddata == null && otherdata != null) {
      return HasOtherData(
          color: color, title: title, routepage: routepage, data: otherdata);
    } else {
      return DosentHasData(color: color, title: title, routepage: routepage);
    }
  }
}

class HasData extends StatelessWidget {
  const HasData(
      {Key key,
      @required this.color,
      @required this.title,
      @required this.routepage,
      @required this.data})
      : super(key: key);

  final Color color;
  final String title;
  final String routepage;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(width: 0.3, color: Colors.white)),
      elevation: 5.0,
      // margin: EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.centerLeft,
        // color: color,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CreatTilteTextItem(title),
                SizedBox(
                  width: 20.0,
                ),
                FlatButton(
                    color: Colors.pink[400],
                    child: Text(
                      '更新資料',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.pushNamed(context, routepage)),
              ],
            ),
            Divider(
              height: 10.0,
              thickness: 1.5,
              color: Colors.black,
            ),
            // Text(data.toString()),
            Container(
                padding: EdgeInsets.only(left: 5.0),
                // color: Colors.yellowAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var i = 0; i < data.length; i++)
                      Column(
                        children: <Widget>[
                          Text(
                            ((i + 1).toString() +
                                '.' +
                                data[i]['medChtName'] +
                                '\n' +
                                '\t(' +
                                data[i]['medCategory']+')'),
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(
                            height: 5.0,
                          )
                        ],
                      )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class HasOtherData extends StatelessWidget {
  const HasOtherData(
      {Key key,
      @required this.color,
      @required this.title,
      @required this.routepage,
      @required this.data})
      : super(key: key);

  final Color color;
  final String title;
  final String routepage;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(width: 0.3, color: Colors.white)),
      elevation: 5.0,
      // margin: EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.centerLeft,
        // color: color,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CreatTilteTextItem(title),
                SizedBox(
                  width: 20.0,
                ),
                FlatButton(
                    color: Colors.pink[400],
                    child: Text(
                      '更新資料',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.pushNamed(context, routepage)),
              ],
            ),
            Divider(
              height: 10.0,
              thickness: 1.5,
              color: Colors.black,
            ),
            // Text(data.toString()),
            Container(
                padding: EdgeInsets.only(left: 5.0),
                // color: Colors.yellowAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var i = 0; i < data.length; i++)
                      Column(
                        children: <Widget>[
                          Text(
                            ((i + 1).toString() + '.' + data[i]),
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 5.0,
                          )
                        ],
                      )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class DosentHasData extends StatelessWidget {
  const DosentHasData({
    Key key,
    @required this.color,
    @required this.title,
    @required this.routepage,
  }) : super(key: key);

  final Color color;
  final String title;
  final String routepage;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(width: 0.3, color: Colors.white)),
      elevation: 5.0,
      // margin: EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.centerLeft,
        // color: color,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CreatTilteTextItem(title),
                SizedBox(
                  width: 20.0,
                ),
                FlatButton(
                    color: Colors.pink[400],
                    child: Text(
                      '更新資料',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.pushNamed(context, routepage)),
              ],
            ),
            Divider(
              height: 10.0,
              thickness: 1.5,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.0),
              // color: Colors.yellowAccent,
              child: Text(
                '目前尚無資料',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
