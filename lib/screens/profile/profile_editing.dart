import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frametest/models/user.dart';
import 'package:frametest/services/database.dart';
import 'package:frametest/widget/TitleTextItem.dart';
import 'package:frametest/widget/loading.dart';
import 'package:provider/provider.dart';

class ProfileEditing extends StatefulWidget {
  static const String routeName = '/ProfileEditing';

  @override
  _ProfileEditingState createState() => _ProfileEditingState();
}

class _ProfileEditingState extends State<ProfileEditing> {
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentBirthday;
  String _currentGender;
  double _currentheight;
  double _currentweight;

  String groupValue = '男';

  bool validateBirthday(String value) {
    Pattern pattern =
        r'^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$';
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(value)) ? true : false;
  }

  bool validateNumber(String value) {
    Pattern pattern = r'^([1-9][0-9]*)+(.[0-9]{1,1})?$';
    Pattern zeropattern = r'[1-9]$';
    RegExp regex = new RegExp(pattern);
    RegExp regexZero = new RegExp(zeropattern);
    return (regex.hasMatch(value) || regexZero.hasMatch(value)) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('個人基本資料更新'),
        ),
        body: StreamBuilder<UserData>(
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
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(
                                    color: Color(0xffba2d65), width: 3.0),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffba2d65),
                                    blurRadius: 3.0,
                                    // offset: Offset(
                                    //   1.0, // horizontal, move right 10
                                    //   1.0, // vertical, move down 10
                                    // ),
                                  )
                                ]),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '個人資料更新',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  '(若無需更新之欄位保持預設值即可)',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.redAccent[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 30.0,
                            thickness: 1.0,
                            color: Colors.grey[400],
                          ),
                          CreatTilteTextItem('姓名'),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextFormField(
                              initialValue: userData.name,
                              validator: (val) => val.isEmpty ? '請輸入姓名' : null,
                              onChanged: (val) =>
                                  setState(() => _currentName = val),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              CreatTilteTextItem('生日'),
                              Text(' (輸入範例 : 2001-01-01) ')
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextFormField(
                              initialValue: userData.birthday,
                              validator: (val) => val.isEmpty
                                  ? '請輸入生日'
                                  : (!validateBirthday(val)
                                      ? '輸入正確格式之生日'
                                      : null),
                              onChanged: (val) =>
                                  setState(() => _currentBirthday = val),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              CreatTilteTextItem('性別'),
                              Container(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Row(
                                  children: <Widget>[
                                    Radio<String>(
                                      value: '男',
                                      groupValue:
                                          _currentGender ?? userData.gender,
                                      onChanged: (val) =>
                                          setState(() => _currentGender = val),
                                      activeColor: Colors.red,
                                    ),
                                    Text('男'),
                                    SizedBox(width: 40.0),
                                    Radio<String>(
                                      value: '女',
                                      groupValue:
                                          _currentGender ?? userData.gender,
                                      onChanged: (val) =>
                                          setState(() => _currentGender = val),
                                      activeColor: Colors.red,
                                    ),
                                    Text('女'),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.0),
                          CreatTilteTextItem('身高'),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextFormField(
                              initialValue: userData.height.toString(),
                              validator: (val) => val.isEmpty
                                  ? '請輸入身高'
                                  : (!validateNumber(val) ? '輸入正確之身高' : null),
                              keyboardType: TextInputType.number,
                              onChanged: (val) => setState(
                                  () => _currentheight = double.parse(val)),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          CreatTilteTextItem('體重'),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextFormField(
                              initialValue: userData.weight.toString(),
                              validator: (val) => val.isEmpty
                                  ? '請輸入體重'
                                  : (!validateNumber(val) ? '輸入正確之體重' : null),
                              keyboardType: TextInputType.number,
                              onChanged: (val) => setState(
                                  () => _currentweight = double.parse(val)),
                            ),
                          ),
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
                          RaisedButton(
                            color: Colors.pink[400],
                            child: Text(
                              '更新',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                await DatabaseService(uid: user.uid)
                                    .updateUserData(
                                  _currentName ?? userData.name,
                                  _currentBirthday ?? userData.birthday,
                                  _currentGender ?? userData.gender,
                                  _currentheight ?? userData.height,
                                  _currentweight ?? userData.weight,
                                );
                                Navigator.pop(context);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Loading();
            }
          },
        ),
      ),
    );
  }
}
