import 'package:flutter/material.dart';
import 'package:frametest/main.dart';
import 'package:frametest/models/medandfood_modle.dart';
import 'package:frametest/services/database.dart';
import 'package:frametest/widget/TitleTextItem.dart';
import 'package:frametest/widget/loading.dart';

class about1 extends StatefulWidget {
  @override
  _about1State createState() => _about1State();
}

class _about1State extends State<about1> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MainInfo>(
        stream: DatabaseService().maininfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List meds = [
              '脈化寧錠 5 毫克',
              '脈化寧錠 2.5 毫克',
              '脈化寧錠 1 毫克',
            ];
            MainInfo maininfo = snapshot.data;
            return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.grey[300],
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CreatTilteTextItem('MAFARIN TABLETS 5 MG'),
                        Divider(
                          height: 10.0,
                          thickness: 1.5,
                          color: Colors.black,
                        ),
                        Card(
                            color: Colors.blue[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    width: 0.3, color: Colors.white)),
                            elevation: 5.0,
                            child: Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(maininfo.name,style: TextStyle(fontSize: 18)),
                                    SizedBox(height: 10.0),
                                    Text('適應症:\t' + maininfo.cureitem,style: TextStyle(fontSize: 16)),
                                    SizedBox(height: 10.0),
                                    Text('副作用:\t' + maininfo.aftereffect,style: TextStyle(fontSize: 16)),
                                    SizedBox(height: 10.0),
                                    Text('警語:\t' + maininfo.careitem,style: TextStyle(fontSize: 16)),
                                    SizedBox(height: 10.0),
                                    Text('使用禁忌:\t' + maininfo.contradictions,style: TextStyle(fontSize: 16)),
                                    SizedBox(height: 10.0),
                                    Text('懷孕授乳注意事項:\t' + maininfo.mamiitem,style: TextStyle(fontSize: 16)),
                                  ],
                                ))),
                        // Card(
                        //     color: Colors.indigoAccent[100],
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         side: BorderSide(
                        //             width: 0.3, color: Colors.white)),
                        //     elevation: 5.0,
                        //     child: Container(
                        //         width: double.maxFinite,
                        //         padding: const EdgeInsets.all(10.0),
                        //         child: Text('適應症:\t' + maininfo.cureitem))),
                        // Card(
                        //     color: Colors.indigoAccent[100],
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         side: BorderSide(
                        //             width: 0.3, color: Colors.white)),
                        //     elevation: 5.0,
                        //     child: Container(
                        //         width: double.maxFinite,
                        //         padding: const EdgeInsets.all(10.0),
                        //         child: Text('副作用:\t' + maininfo.aftereffect))),
                        // Card(
                        //     color: Colors.indigoAccent[100],
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         side: BorderSide(
                        //             width: 0.3, color: Colors.white)),
                        //     elevation: 5.0,
                        //     child: Container(
                        //         width: double.maxFinite,
                        //         padding: const EdgeInsets.all(10.0),
                        //         child: Text('警語:\t' + maininfo.careitem))),
                        // Card(
                        //     color: Colors.indigoAccent[100],
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         side: BorderSide(
                        //             width: 0.3, color: Colors.white)),
                        //     elevation: 5.0,
                        //     child: Container(
                        //         width: double.maxFinite,
                        //         padding: const EdgeInsets.all(10.0),
                        //         child:
                        //             Text('使用禁忌:\t' + maininfo.contradictions))),
                        // Card(
                        //     color: Colors.indigoAccent[100],
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         side: BorderSide(
                        //             width: 0.3, color: Colors.white)),
                        //     elevation: 5.0,
                        //     child: Container(
                        //         width: double.maxFinite,
                        //         padding: const EdgeInsets.all(10.0),
                        //         child:
                        //             Text('懷孕授乳注意事項:\t' + maininfo.mamiitem))),
                        // for (int i = 0; i < maininfo.length; i++)
                        //   Card(
                        //     color: Colors.indigoAccent[100],
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         side: BorderSide(
                        //             width: 0.3, color: Colors.white)),
                        //     elevation: 5.0,
                        //     child: Container(
                        //       width: double.maxFinite,
                        //       padding: const EdgeInsets.all(10.0),
                        //       child: Text(
                        //           (i + 1).toString() + '.\t' + maininfo.effect),
                        //     ),
                        //   )
                      ],
                    ),
                  ),
                ));
          } else {
            return Loading();
          }
        });
  }
}
