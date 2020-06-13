import 'package:flutter/material.dart';
import 'package:frametest/models/medandfood_modle.dart';
import 'package:frametest/models/user.dart';
import 'package:frametest/routes/Routes.dart';
import 'package:frametest/services/database.dart';
import 'package:frametest/widget/TitleTextItem.dart';
import 'package:frametest/widget/loading.dart';
import 'package:frametest/widget/medandfood_card.dart';
import 'package:provider/provider.dart';

class MedandFoodPreview extends StatefulWidget {
  @override
  _MedandFoodPreviewState createState() => _MedandFoodPreviewState();
}

class _MedandFoodPreviewState extends State<MedandFoodPreview> {
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
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        // child: Text('Avatar'),
                        backgroundImage: AssetImage('assets/profile.jpg'),
                        radius: 40.0,
                      ),
                      CreatTilteTextItem(userData.name)
                    ],
                  ),
                  Divider(
                    height: 30.0,
                    thickness: 1.0,
                    color: Colors.grey[400],
                  ),
                  MedandFoodCard(
                    color: Colors.green[200],
                    routepage: Routes.westmedicineEditing,
                    westmeddata: userData.westmed,
                    title: '個人西藥品',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  MedandFoodCard(
                    color: Colors.indigo[200],
                    routepage: Routes.chinesemedicineEditing,
                    otherdata: userData.chinesemed,
                    title: '個人中藥品',
                  ),
                  SizedBox(height: 10.0),
                  MedandFoodCard(
                    color: Colors.orange[200],
                    routepage: Routes.foodEditing,
                    otherdata: userData.food,
                    title: '個人食品',
                  ),
                ]),
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
