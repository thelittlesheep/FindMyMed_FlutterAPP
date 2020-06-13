import 'package:frametest/models/resmedicine_modle.dart';

class ResmedicineReoisitory {
  List cateList;

  ResmedicineReoisitory({this.cateList});

  List<Map> getALL() => _resmedicine;

  getMedicineByCategory(String category) => _resmedicine
      .map((map) => ResMedicineModle.fromJson(map))
      .where((item) => item.category == category)
      .map((item) => item.medicine)
      .expand((i) => i)
      .toList();
  List<String> getCategory() => _resmedicine
      .map((map) => ResMedicineModle.fromJson(map))
      .map((item) => item.category)
      .toList();

  List _resmedicine = [
    {
      'category': 'CVD',
      'medicine': ['C', 'V', 'D']
    },
    {
      'category': 'Diabetes',
      'medicine': ['Diabetes1', 'Diabetes2', 'Diabetes3']
    },
    {
      'category': 'Kidneydisease',
      'medicine': ['Kidneydisease1', 'Kidneydisease2', 'Kidneydisease3']
    },
    {
      'category': 'Hypertension',
      'medicine': ['Hypertension1', 'Hypertension2', 'Hypertension3']
    }
  ];
}
