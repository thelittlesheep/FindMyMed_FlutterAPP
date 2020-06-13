import 'package:flutter/material.dart';
import 'package:frametest/models/user.dart';
import 'package:frametest/routes/Routes.dart';
import 'package:frametest/services/database.dart';
import 'package:frametest/widget/TitleTextItem.dart';
import 'package:frametest/widget/loading.dart';
import 'package:provider/provider.dart';

class ProfilePreview extends StatefulWidget {
  @override
  _ProfilePreviewState createState() => _ProfilePreviewState();
}

class _ProfilePreviewState extends State<ProfilePreview> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;

          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.grey[300],
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      // child: Text('Avatar'),
                      backgroundImage: AssetImage('assets/profile.jpg'),
                      radius: 40.0,
                    ),
                    Divider(
                      height: 30.0,
                      thickness: 1.0,
                      color: Colors.grey[400],
                    ),
                    CreatTilteTextItem('姓名 : ' + userData.name),
                    SizedBox(height: 10.0),
                    CreatTilteTextItem('生日 : ' + userData.birthday),
                    SizedBox(height: 10.0),
                    CreatTilteTextItem('性別 : ' + userData.gender),
                    SizedBox(height: 10.0),
                    CreatTilteTextItem('身高 : ' + userData.height.toString()),
                    SizedBox(height: 10.0),
                    CreatTilteTextItem('體重 : ' + userData.weight.toString()),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Text(
                        '使用者編號 :  \n' + userData.uid,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.lightBlue[800]),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlatButton(
                        color: Colors.pink[400],
                        child: Text(
                          '更新資料',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.profileEditing)),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
