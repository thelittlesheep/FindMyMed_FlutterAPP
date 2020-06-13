import 'package:flutter/material.dart';
import 'package:frametest/models/medandfood_modle.dart';
import 'package:frametest/models/user.dart';
import 'package:frametest/routes/Routes.dart';
import 'package:frametest/services/database.dart';
import 'package:frametest/services/interactionlogic.dart';
import 'package:frametest/widget/TitleTextItem.dart';
import 'package:frametest/widget/interaction_card.dart';
import 'package:frametest/widget/loading.dart';
import 'package:frametest/widget/medandfood_card.dart';
import 'package:provider/provider.dart';

class InteractionPreview extends StatefulWidget {
  @override
  _InteractionPreviewState createState() => _InteractionPreviewState();
}

class _InteractionPreviewState extends State<InteractionPreview> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          List userWestmed = userData.chinesemed;

          // List userWestmed = userData.westmed;
          List userChinesemed = userData.chinesemed;
          List userFood = userData.food;
          String chinesemed =
              '* 服用warfarin併用當歸、獨活、丹參、紅花、桃仁、五靈脂、銀杏、大蒜、黨參，有出血的可能性。';
          String food =
              '* 攝取過量的動物肝臟或深綠色蔬菜(ex菠菜、花椰菜、蘆筍、萵苣…)會抑制藥物的作用。 * 進食大量含有維生素E的植物油，會增強藥效。 * 諾麗果汁、甘菊茶、蔓越莓汁應避免與warfarin併用，會影響凝血作用。 * 應避免突然大量飲酒及長期酗酒。大量攝取酒精會抑制warfarin代謝，而長期酗酒則會增加warfarin代謝。 * 食用紅麴保健食品且同時服用warfarin，須告知醫師調整劑量。';
          List chinesemedls = strsplit(chinesemed);
          List foodls = strsplit(food);

          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.grey[300],
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  StreamBuilder<MainInfo>(
                      stream: DatabaseService(
                              medcategory: 'WARFARIN', diseasecategory: 'CVD')
                          .maininfo,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          MainInfo warfarinInfo = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                // InteractionCard(
                                //   color: Colors.grey[300],
                                //   title: '交互作用',
                                //   data: userWestmed,
                                //   data2: warfarinInfo,
                                // ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        CreatTilteTextItem('交互作用'),
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
                                                Card(
                                                  color: Colors.blue[100],
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      side: BorderSide(width: 0.3,color: Colors.white)),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:const EdgeInsets.all(4.0),
                                                        child: Column(
                                                          crossAxisAlignment:CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text('1.〝政德〞可化凝錠１毫克',style: TextStyle(fontSize: 20)),
                                                            Text(' (COFARIN TAB 1MG "GENTLE")',style: TextStyle(fontSize: 20)),
                                                            SizedBox(height: 10.0),
                                                            Text('中藥',style: TextStyle(fontSize: 18)),
                                                            for (var i = 0; i <chinesemedls.length; i++)
                                                            Text(chinesemedls[i],style: TextStyle(fontSize: 16)),
                                                            SizedBox(height: 5.0),
                                                            Text('中藥交互作用資料來源:【王婷瑩，2011；桃園長庚醫院中醫藥劑部，2011】',
                                                                style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold)),
                                                            SizedBox(height: 5.0),
                                                            Text('食品',style: TextStyle(fontSize: 18)),
                                                            for (var i = 0;i <foodls.length;i++)
                                                              Text(foodls[i],style: TextStyle(fontSize: 16)),
                                                            SizedBox(height: 5.0),
                                                            Text('食品交互作用資料來源:【桃園長庚醫院中醫藥劑部，2011】',
                                                                style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold)),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )),
                                      ]),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Loading();
                        }
                      }),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }

  List<String> strsplit(String strinput) {
    int startIndex = 0;
    int endIndex = 0;

    List<String> strls = new List();
    do {
      if ((startIndex = strinput.indexOf('*', startIndex)) >= 0) {
        endIndex = strinput.indexOf('。', startIndex + 1);
        strls.add(strinput.substring(startIndex, endIndex + 1));
        startIndex = endIndex + 1;
      }
    } while (startIndex >= 0);

    return strls;
  }
}
