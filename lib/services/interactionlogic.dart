import 'package:flutter/cupertino.dart';
import 'package:frametest/models/medandfood_modle.dart';
import 'package:frametest/services/database.dart';
import 'package:frametest/widget/loading.dart';

class Interaction {
  final String diseasecategory;
  final String medcategory;
  Interaction({this.diseasecategory, this.medcategory});

  var data = DatabaseService().updateUserData;
  
}
