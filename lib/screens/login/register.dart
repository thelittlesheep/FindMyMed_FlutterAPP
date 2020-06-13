import 'package:flutter/material.dart';
import 'package:frametest/services/auth.dart';
import 'package:frametest/widget/constant.dart';
import 'package:frametest/widget/loading.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(value)) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('藥品找知道 - 註冊'),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('登入'))
              ],
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'Email'),
                              validator: (val) => val.isEmpty
                                  ? '請輸入信箱'
                                  : (!validateEmail(val) ? '輸入正確格式之信箱' : null),
                              onChanged: (val) {
                                setState(() => email = val);
                              }),
                          SizedBox(height: 20),
                          TextFormField(
                              decoration:
                                  textInputDecoration.copyWith(hintText: '密碼'),
                              obscureText: true,
                              validator: (val) =>
                                  val.length < 6 ? '請輸入至少大於6字元的密碼' : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              }),
                          RaisedButton(
                            color: Colors.pink[400],
                            child: Text(
                              '註冊',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEamilAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = '該信箱已被註冊';
                                    loading = false;
                                  });
                                }
                              }
                            },
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          )
                        ],
                      ))),
            ));
  }
}
