class WestMedicine {
  final int durgNo;
  final String name;
  final String tags;
  final String cureitem;
  final String aftereffect;
  final String careitem;
  final String contradictions;
  final String effect;
  final String useway;
  final String interaction;

  WestMedicine(
      {this.durgNo,
      this.name,
      this.tags,
      this.cureitem,
      this.aftereffect,
      this.careitem,
      this.contradictions,
      this.effect,
      this.useway,
      this.interaction});
}

class ChineseMedicine {
  final int dataNo;
  final String chineseName;
  final String westName;
  final String westSaleName;
  final String westChineseName;
  final String interaction;
  final String reason;
  final String suggest;

  ChineseMedicine(
      {this.dataNo,
      this.chineseName,
      this.westName,
      this.westSaleName,
      this.westChineseName,
      this.interaction,
      this.reason,
      this.suggest});
}

class Food {
  final int foodNo;
  final String foodcategory;
  final String datatype;
  final String foodName;
  final String foodTrivialName;
  final String foodEnglishName;
  final String foodDiscribe;

  Food(
      {this.foodNo,
      this.foodcategory,
      this.datatype,
      this.foodName,
      this.foodTrivialName,
      this.foodEnglishName,
      this.foodDiscribe});
}

class Resmedicine {
  final String westNo;
  final String westEnName;
  final String category;
  final List resMedCategoryList;
  final List resMedChtCategoryList;

  Resmedicine(
      {this.westNo,
      this.westEnName,
      this.category,
      this.resMedCategoryList,
      this.resMedChtCategoryList});
}

class MainInfo {
  final String name;
  final String diseaseCategory;
  final String cureitem;
  final String aftereffect;
  final String careitem;
  final String contradictions;
  final String effect;
  final String useway;
  final String mamiitem;
  final List chinesemeditemlist;
  final List fooditemlist;
  final String chinesemedinteractiondescribe;
  final String foodinteractiondescribe;

  MainInfo(
      {this.name,
      this.diseaseCategory,
      this.cureitem,
      this.aftereffect,
      this.careitem,
      this.contradictions,
      this.effect,
      this.useway,
      this.chinesemedinteractiondescribe,
      this.chinesemeditemlist,
      this.foodinteractiondescribe,
      this.fooditemlist,
      this.mamiitem});
}

class Categorys {
  final List chineseMedicineList;
  final List categoeyList;
  final String diseaseCategory;
  final String diseasechCategory;
  final Map medicineMap;

  Categorys(
      {this.chineseMedicineList,
      this.categoeyList,
      this.diseaseCategory,
      this.diseasechCategory,
      this.medicineMap});
}
