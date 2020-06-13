import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/widget/drawer.dart';

class InteractionPage extends StatefulWidget {
  static const String routeName = '/InteractionPage';
  @override
  _InteractionPageState createState() => _InteractionPageState();
}

class _InteractionPageState extends State<InteractionPage> {

  final DatabaseReference fireBaseDB = FirebaseDatabase.instance.reference();
  StreamSubscription<Event> fireBaseDBSubScription;
  StreamSubscription _subscriptionwestmed;

  String _infomation = "Display the med info here";
  int _drugno = 0;
  String _name = '';
  String _tags = '';
  String _effect = '';
  String _cureitem = '';
  String _careitem = '';
  String _contradictions = '';
  String _interaction = '';
  String _aftereffect = '';


  @override
  void initState() {
    FirebaseWestmeds.getTodoStream("0", _updateTodo)
        .then((StreamSubscription s) => _subscriptionwestmed = s);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fireBaseDBSubScription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          return null;
        },
        child: SafeArea(
            child: Scaffold(
                drawer: AppDrawer(),
                appBar: AppBar(title: Text('交互作用警示'),),
                body: Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text("藥品編號:$_drugno", textAlign: TextAlign.center,),
                          Text("藥品名稱:$_name", textAlign: TextAlign.center,),
                          Text("藥品標籤:$_tags", textAlign: TextAlign.center,),
                          Text("$_effect", textAlign: TextAlign.center,),
                          Text("$_cureitem", textAlign: TextAlign.center,),
                          Text("$_careitem", textAlign: TextAlign.center,),
                          Text("$_contradictions", textAlign: TextAlign.center,),
                          Text("$_interaction", textAlign: TextAlign.center,),
                          Text("$_aftereffect", textAlign: TextAlign.center,),
                        ],
                      ),
                    )
                )
            )
        )
    );
  }

  _updateTodo(westmed value) {
    var drugno = value.drugno;
    var name = value.name;
    var tags = value.tags;
    var effect = value.effect;
    var cureitem = value.cureitem;
    var careitem = value.careitem;
    var contradictions = value.contradictions;
    var interaction = value.interaction;
    var aftereffect = value.aftereffect;

    setState(() {
      _drugno = drugno;
      _name = name;
      _tags = tags;
      _effect = effect;
      _cureitem = cureitem;
      _careitem = careitem;
      _contradictions = contradictions;
      _interaction = interaction;
      _aftereffect = aftereffect;
    });
  }
}

class westmed {
  final String key;
  int drugno;
  String name;
  String tags;
  String effect;
  String cureitem;
  String careitem;
  String contradictions;
  String interaction;
  String aftereffect;

  westmed.fromJson(this.key, Map data) {
    drugno = data['DrugNo'];
    name = data['name'];
    tags = data['tags'];
    effect = data['effect'];
    cureitem = data['cureitem'];
    careitem = data['careitem'];
    contradictions = data['contradictions'];
    interaction = data['interaction'];
    aftereffect = data['aftereffect'];
  }
}

class FirebaseWestmeds {
  static Future<StreamSubscription<Event>> getTodoStream(String westmedKeys,
      void onData(westmed todo)) async {

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("medicine")
        .child("westmed")
        .child(westmedKeys)
        .onValue
        .listen((Event event) {
      var todo = new westmed.fromJson(event.snapshot.key, event.snapshot.value);
      onData(todo);
    });

    return subscription;
  }
}