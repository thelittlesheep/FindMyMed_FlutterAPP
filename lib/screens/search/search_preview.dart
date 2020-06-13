import 'package:flutter/material.dart';

class searchPreview extends StatefulWidget {
  @override
  _searchPreviewState createState() => _searchPreviewState();
}

class _searchPreviewState extends State<searchPreview> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 100.0),
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
                        border: Border.all(color: Colors.red, width: 3.0),
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 3.0,
                          )
                        ]),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '藥品搜尋',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        //     SizedBox(height: 10.0),
                        //     Text(
                        //       '(在底下搜尋欄搜尋藥品)',
                        //       style: TextStyle(
                        //         fontSize: 15.0,
                        //         color: Colors.redAccent[400],
                        //       ),
                        //     ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                    thickness: 1.0,
                    color: Colors.grey[400],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      initialValue: '請輸入藥品名稱',
                      validator: (val) => val.isEmpty ? '請輸入姓名' : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
