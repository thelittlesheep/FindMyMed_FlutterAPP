import 'package:flutter/material.dart';
import 'package:frametest/models/medandfood_modle.dart';
import 'package:frametest/models/user.dart';
import 'package:frametest/services/database.dart';
import 'package:frametest/widget/loading.dart';
import 'package:frametest/widget/resmedicinerepo.dart';
import 'package:provider/provider.dart';

class WestmedicineEditing extends StatefulWidget {
  static const String routeName = '/WestmedicineEditing';

  @override
  _WestmedicineEditingState createState() => _WestmedicineEditingState();
}

class _WestmedicineEditingState extends State<WestmedicineEditing> {
  final _formKey = GlobalKey<FormState>();

  List<String> _medicine = ['請先選擇疾病分類'];
  List<String> _drug = ['請先選擇主成分'];
  String _selectedCategory;
  String _selectedMedicine = '請先選擇疾病分類';
  String _selecteddrug;
  List medicines = new List();
  Map resmedicinePair = new Map();
  Map categoryNo = new Map();
  List<DropdownMenuItem<String>> medicineItems = [];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('個人西藥更新')),
        body: StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;
                return StreamBuilder<Categorys>(
                  stream: DatabaseService().westMedicineCategory,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Categorys cat = snapshot.data;

                      List<DropdownMenuItem<String>> categoryItems =
                          _createItems(cat);

                      return Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        color: Colors.grey[300],
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              DropdownButton(
                                items: categoryItems,
                                onChanged: (value) {
                                  if (value != null) {
                                    _onSelectedCategory(value);
                                  } else {
                                    setState(() {
                                      _selectedCategory = null;
                                      _medicine = ['請先選擇疾病分類'];
                                      _selectedMedicine = '請先選擇疾病分類';
                                    });
                                  }
                                },
                                value: _selectedCategory,
                                isExpanded: true,
                              ),
                              // DropdownButton(
                              //   items:
                              //       _medicine.map((String dropDownStringItem) {
                              //     return DropdownMenuItem<String>(
                              //       value: dropDownStringItem,
                              //       child: Text(dropDownStringItem),
                              //     );
                              //   }).toList(),
                              //   onChanged: (value) {
                              //     if (value == '請選擇藥品' || value == '請先選擇疾病分類') {
                              //       _selectedMedicine = null;
                              //     } else {
                              //       _onSelectedMedicine(value);
                              //       _creatMedicineList(
                              //           cat,
                              //           categoryNo[_selectedCategory],
                              //           _selectedMedicine);
                              //       _onselectedMaincomposition();
                              //       medicineItems = _createMedicineItems(_drug);
                              //     }
                              //   },
                              //   value: _selectedMedicine,
                              //   isExpanded: true,
                              // ),
                              DropdownButton(
                                // items: [
                                //   DropdownMenuItem(
                                //     child: Text('a'),
                                //     value: '0',
                                //   ),
                                //   DropdownMenuItem(
                                //     child: Text('b'),
                                //     value: '1',
                                //   )
                                // ],
                                items: medicineItems,
                                onChanged: (val) {
                                  setState(() {
                                    _selecteddrug = val;
                                  });
                                },
                                value: _selecteddrug,
                                isExpanded: true,
                              ),
                              // Text(_selectedCategory ?? ''),
                              // Text(_selectedMedicine ?? ''),
                              // Text(medicines.toString()),
                              // Text(_drug.toString()),
                              // Text(medicineItems.toString()),
                              // Text(_selecteddrug),
                              SizedBox(height: 20.0),
                              RaisedButton(
                                  color: Colors.pink[400],
                                  child: Text(
                                    '更新',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    if (_selectedMedicine == null ||
                                        _selectedMedicine == '請選擇藥品' ||
                                        _selectedMedicine == '請先選擇疾病分類') {
                                      print('No medicine');
                                    } else {
                                      await DatabaseService(uid: user.uid)
                                          .addUesrWestMedicine(userData.westmed
                                            ..add(_selectedMedicine));
                                      Navigator.pop(context);
                                    }
                                  })
                              // Text(selectedMedicine),
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

  List<DropdownMenuItem<String>> _createItems(Categorys cat) {
    List<DropdownMenuItem<String>> categoryItems = [];

    categoryItems.add(DropdownMenuItem(
      child: Text('請選擇疾病分類'),
      value: null,
    ));

    for (int i = 0; i < cat.categoeyList.length ?? 0; i++) {
      Map categoryMap = cat.categoeyList[i];
      String category = categoryMap['disease'] ?? ['No Data'];
      String categorych = categoryMap['diseasech'] ?? ['No Data'];
      List medicine = categoryMap['composition'] ?? ['No Data'];

      categoryItems.add(DropdownMenuItem(
        child: Text(categorych),
        value: '$category',
      ));
      resmedicinePair[category] = medicine;
      categoryNo[category] = i;
    }
    return categoryItems;
  }

  void _onSelectedCategory(String value) {
    // print('Before select categoey : $_medicine');
    setState(() {
      _selectedMedicine = '請選擇藥品';
      _medicine = ['請選擇藥品'];
      // print('After select categoey and initial  : $_medicine');
      _selectedCategory = value;
      for (int i = 0; i < resmedicinePair[value].length; i++) {
        _medicine = List.from(_medicine)
          ..add(resmedicinePair[value][i].toString());
      }
    });
    // print('Done with new category medicineList : $_medicine');
  }

  void _onselectedMaincomposition() {
    setState(() {
      for (int i = 0; i < medicines.length; i++) {
        _drug = List.from(_drug)..add(medicines[i].toString());
      }
    });
  }

  List<DropdownMenuItem<String>> _createMedicineItems(List med) {
    List<DropdownMenuItem<String>> medicineItems = [];

    for (int i = 0; i < med.length ?? 0; i++) {
      medicineItems
          .add(DropdownMenuItem(child: Text(med[i].toString()), value: med[i]));
    }
    return medicineItems;
  }

  void _onSelectedMedicine(String value) {
    setState(() {
      _selectedMedicine = value;
      _drug = ['請選擇藥品'];
    });
  }

  void _creatMedicineList(Categorys cat, int index, String category) {
    setState(() {
      medicines = cat.categoeyList[index]['medicine'][category];
    });
  }
}
