import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frametest/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('藥品找知道'),),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    onChanged: (val){
                      setState(() => email = val );
                    }
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val){
                      setState(() => password = val );
                    }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: ()async{
                          dynamic result = await _auth.singInAnon();
                          if (result == null){
                            print('error signing in');
                          } else {
                            print('singned in');
                            print(result.uid);
                          }
                        },
                        color: Colors.pink[400],
                        child: Text(
                            '不註冊直接登入',
                            style: TextStyle(color: Colors.white),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          '登入',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async{
                          print(email);
                          print(password);
                        },
                      )
                    ],
                  )
                ]
            )
          )
        )
    );
  }
}