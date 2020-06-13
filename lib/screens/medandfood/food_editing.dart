import 'package:flutter/material.dart';
import 'package:frametest/models/medandfood_modle.dart';
import 'package:frametest/models/user.dart';
import 'package:frametest/services/database.dart';
import 'package:frametest/widget/loading.dart';
import 'package:frametest/widget/resmedicinerepo.dart';
import 'package:provider/provider.dart';

class FoodEditing extends StatefulWidget {
  static const String routeName = '/FoodEditing';

  @override
  _FoodEditingState createState() => _FoodEditingState();
}

class _FoodEditingState extends State<FoodEditing> {
  String _selectedMedicine;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('個人食品更新')),
        body: StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;

                return StreamBuilder<Categorys>(
                  stream: DatabaseService().chineseMedicine,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Categorys cat = snapshot.data;

                      List<DropdownMenuItem> medicineItems = [];

                      medicineItems.add(DropdownMenuItem(
                        child: Text('請選擇藥物'),
                        value: null,
                      ));

                      for (int i = 0;
                          i < cat.chineseMedicineList.length ?? [];
                          i++) {
                        medicineItems.add(DropdownMenuItem(
                          child: Text(cat.chineseMedicineList[i]),
                          value: cat.chineseMedicineList[i],
                        ));
                      }

                      return Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        color: Colors.grey[300],
                        child: Form(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(20.0),
                            child: Column(children: <Widget>[
                              DropdownButton(
                                items: medicineItems,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedMedicine = value;
                                    });
                                  }
                                },
                                value: _selectedMedicine,
                                isExpanded: true,
                              ),
                              SizedBox(height: 20.0),
                              RaisedButton(
                                  color: Colors.pink[400],
                                  child: Text(
                                    '更新',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    if (_selectedMedicine == null ||
                                        _selectedMedicine == '請選擇藥物') {
                                      print('No medicine');
                                    } else {
                                      await DatabaseService(uid: user.uid)
                                          .addUesrChineseMedicine(
                                              userData.chinesemed
                                                ..add(_selectedMedicine));
                                      Navigator.pop(context);
                                    }
                                  }),
                              Text(_selectedMedicine ?? 'Not select yet'),
                            ]),
                          ),
                        ),
                      );
                    } else {
                      return Loading();
                    }
                  },
                );
              } else {
                return Loading();
              }
            }),
      ),
    );
  }
}
