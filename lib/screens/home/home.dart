import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frametest/models/member.dart';
import 'package:frametest/screens/home/fakenews.dart';
import 'package:frametest/services/auth.dart';
import 'package:frametest/widget/drawer.dart';
import 'package:frametest/services/database.dart';
import 'package:provider/provider.dart';

import 'news.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> _onWillPop() async {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      Navigator.pop(context);
    } else {
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit an App'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Yes'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, //or set color with: Color(0xFF0000FF)
    ));
  }

  @override
  Widget build(BuildContext context) {
    // void _showSettingPanel() {
    //   showModalBottomSheet(context: context, builder: (context) {
    //     return Container(
    //       padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
    //       child: SettingsForm()
    //     );
    //   });
    // }
    List fakenewstext = [
      '網傳「木瓜是百藥之王，美國農業部公佈，日後腫瘤的新治療方法」？',
      '新冠肺炎疫情的事實查核—羥氯奎寧如何被政治人物誇大為神藥靈丹',
      '聽說蜂蜜加熱超過40度C會有毒，這是真的嗎？',
      '聽說多喝溫開水泡鹽巴，可以治療新型冠狀病毒，這是真的嗎？',
      '有關網路流傳「台灣麵包危險，勿食用」，這是真的嗎？'
    ];
    List newstext = [
      '公告修訂含eszopiclone、zaleplon、zolpidem及zopiclone成分藥品的使用原則',
      '非藥品卻論及「醫療效能」，「水神」抗菌液遭開罰66萬！',
      '食藥署澄清安眠藥”使蒂諾斯”無缺藥疑慮',
    ];

    return StreamProvider<List<Member>>.value(
      value: DatabaseService().members,
      child: WillPopScope(
          onWillPop: _onWillPop,
          child: SafeArea(
              child: Scaffold(
                  key: _scaffoldKey,
                  appBar: AppBar(
                    title: Text('藥品找知道'),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          showSearch(context: context, delegate: DataSearch());
                        },
                      ),
                      FlatButton.icon(
                          onPressed: () async {
                            await _auth.signOut();
                          },
                          icon: Icon(Icons.person),
                          label: Text('登出')),
                      // FlatButton.icon(
                      //   icon: Icon(Icons.settings),
                      //   label: Text('設定'),
                      //   onPressed: () => _showSettingPanel(),
                      // )
                    ],
                  ),
                  drawer: AppDrawer(),
                  body: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: Colors.grey[300],
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            // News(
                            //   title: '最新消息',
                            //   color: Colors.blueAccent,
                            //   textdata: newstext,
                            // ),
                            // News(
                            //   title: '假消息闢謠',
                            //   color: Colors.red,
                            //   textdata: fakenewstext,
                            // ),
                            FakeNews(
                              color: Colors.purple[200],
                              title: '最新消息',
                              textdata: newstext,
                            ),
                            FakeNews(
                              color: Colors.pink[200],
                              title: '假消息闢謠',
                              textdata: fakenewstext,
                            )
                          ],
                        ),
                      ),
                    ),
                  )))),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  DataSearch() : super(searchFieldLabel: "請輸入藥品");
  final cities = [
    // '〝政德〞可化凝錠１毫克',
    // '脈化寧錠 5 毫克',
    // '脈化寧錠 2.5 毫克',
    // '脈化寧錠 1 毫克',
    // '"政德"可化凝錠 5 毫克',
    // '歐服寧錠5公絲',
    // '歐服寧錠3公絲',
    'COFARIN TAB 1MG "GENTLE"',
    'MAFARIN TABLETS 5 MG',
    'MAFARIN TABLETS 2.5 MG',
    'MAFARIN TABLETS 1 MG',
    'COFARIN TABLETS 5 MG"GENTLE"',
    'ORFARIN TABLETS 5MG',
    'ORFARIN TABLETS 3MG',
  ];

  final recentCities = [
    // '〝政德〞可化凝錠１毫克',
    // '脈化寧錠 5 毫克',
    // '歐服寧錠 5 公絲',
    // '歐服寧錠 3 公絲',
    'COFARIN TAB 1MG "GENTLE"	',
    'MAFARIN TABLETS 5 MG',
    'MAFARIN TABLETS 2.5 MG',
    'ORFARIN TABLETS 3MG',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((val) => val.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.local_hospital),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          )),
      itemCount: suggestionList.length,
    );
  }
}
