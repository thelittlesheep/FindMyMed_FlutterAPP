class ResMedicineModle {
  String category;
  List<String> medicine;

  ResMedicineModle({this.category, this.medicine});

  ResMedicineModle.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    medicine = json['medicine'].cast<String>();
  }
}
