import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frametest/models/interactionrule.dart';
import 'package:frametest/models/medandfood_modle.dart';
import 'package:frametest/models/member.dart';
import 'package:frametest/models/user.dart';

class DatabaseService {
  final String uid;
  final String medcategory;
  final String diseasecategory;
  DatabaseService({this.uid, this.medcategory, this.diseasecategory});

  // coollection refrence
  final CollectionReference memberCollection =
      Firestore.instance.collection('members');
  final CollectionReference medandfoodDatabaseCollection =
      Firestore.instance.collection('medandfood');
  final CollectionReference westMedicineDatabaseCollection =
      Firestore.instance.collection('westmedicine');
  final CollectionReference chineseMedicineDatabaseCollection =
      Firestore.instance.collection('chinesemedicine');
  final CollectionReference foodDatabaseCollection =
      Firestore.instance.collection('food');
  final CollectionReference interactionRuleCollection =
      Firestore.instance.collection('interactionrule');

  Future updateUserData(String name, String birthday, String gender,
      double height, double weight) async {
    return await memberCollection.document(uid).setData({
      'name': name,
      'birthday': birthday,
      'gender': gender,
      'height': height,
      'weight': weight,
    }, merge: true);
  }

  //add user westmedicine
  Future addUesrWestMedicine(List westmed) async {
    return await memberCollection
        .document(uid)
        .setData({'westmed': FieldValue.arrayUnion(westmed)}, merge: true);
  }

  // del user westmedicine
  // Future delUesrWestMedicine(List westmed) async {
  //   return await memberCollection
  //       .document(uid)
  //       .setData({'westmed': FieldValue.arrayRemove(westmed)}, merge: true);
  // }

  // add user westmedicine
  Future addUesrChineseMedicine(List chinesemed) async {
    return await memberCollection.document(uid).setData(
        {'chinesemed': FieldValue.arrayUnion(chinesemed)},
        merge: true);
  }

  // del user westmedicine
  Future delUesrChineseMedicine(List chinesemed) async {
    return await memberCollection.document(uid).setData(
        {'chinesemed': FieldValue.arrayRemove(chinesemed)},
        merge: true);
  }

  Future getwestMedicineData(
      String database, String diseasecategory, String medcategory) async {
    return await medandfoodDatabaseCollection
        .document('westmed')
        .collection(diseasecategory)
        .snapshots();
  }

  // member list from snapshot
  List<Member> _memberListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Member(
        name: doc.data['name'] ?? 'No Data',
        birthday: doc.data['birthday'] ?? 'No Data',
        gender: doc.data['gender'] ?? 'No Data',
        height: doc.data['height'] ?? 0.0,
        weight: doc.data['weight'] ?? 0.0,
      );
    }).toList();
  }

  // get members stream
  Stream<List<Member>> get members {
    return memberCollection.snapshots().map(_memberListFromSnapshot);
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      birthday: snapshot.data['birthday'],
      gender: snapshot.data['gender'],
      height: snapshot.data['height'] ?? 0.0,
      weight: snapshot.data['weight'] ?? 0.0,
      westmed: snapshot.data['westmed'] ?? [],
      chinesemed: snapshot.data['chinesemed'] ?? [],
      food: snapshot.data['food'] ?? [],
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return memberCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  // mainInfo from snapshot
  MainInfo _mainInfoFromSnapshot(DocumentSnapshot snapshot) {
    return MainInfo(
      name: snapshot.data['name'] ?? 'No Data',
      diseaseCategory: snapshot.data['diseaseCategory'] ?? 'No Data',
      cureitem: snapshot.data['cureitem'] ?? 'No Data',
      aftereffect: snapshot.data['aftereffect'] ?? 'No Data',
      careitem: snapshot.data['careitem'] ?? 'No Data',
      contradictions: snapshot.data['contradictions'] ?? 'No Data',
      effect: snapshot.data['effect'] ?? 'No Data',
      useway: snapshot.data['useway'] ?? 'No Data',
      chinesemedinteractiondescribe:
          snapshot.data['chinesemedinteractiondescribe'] ?? 'No Data',
      chinesemeditemlist: snapshot.data['chinesemeditemlist'] ?? 'No Data',
      foodinteractiondescribe:
          snapshot.data['foodinteractiondescribe'] ?? 'No Data',
      fooditemlist: snapshot.data['fooditemlist'] ?? 'No Data',
      mamiitem: snapshot.data['mamiitem'] ?? 'No Data',
    );
  }

  // get mainInfo stream
  Stream<MainInfo> get maininfo {
    return medandfoodDatabaseCollection
        .document('westmed')
        .collection('CVD')
        .document('WARFARIN')
        .snapshots()
        .map(_mainInfoFromSnapshot);
  }

  // westMedicineCategory data from snapshot
  Categorys _westMedicineCategoryFromSnapshot(DocumentSnapshot snapshot) {
    return Categorys(
      categoeyList: snapshot.data['Category'],
    );
  }

  // get resmedicineCategory stream
  Stream<Categorys> get westMedicineCategory {
    return medandfoodDatabaseCollection
        .document('westmed')
        .snapshots()
        .map(_westMedicineCategoryFromSnapshot);
  }

  // westMedicineCategory data from snapshot
  Categorys _chineseMedicineCategoryFromSnapshot(DocumentSnapshot snapshot) {
    return Categorys(
      chineseMedicineList: snapshot.data['medicine'],
    );
  }

  // get resmedicineCategory stream
  Stream<Categorys> get chineseMedicine {
    return medandfoodDatabaseCollection
        .document('chinesemed')
        .snapshots()
        .map(_chineseMedicineCategoryFromSnapshot);
  }

  // InteractionRule from snapshot
  InteractionRule _interactionRuleFromSnapshot(DocumentSnapshot snapshot) {
    return InteractionRule(
      wsetNo: snapshot.data['wsetNo'],
      westName: snapshot.data['westName'],
      type: snapshot.data['type'],
      fooditemlist: snapshot.data['fooditemlist'],
      fooddescribe: snapshot.data['fooddescribe'],
      chinesemeditemlist: snapshot.data['chinesemeditemlist'],
      chinesemeddescribe: snapshot.data['chinesemeddescribe'],
    );
  }

  // get interactionRule doc stream
  Stream<InteractionRule> get interactionRule {
    return interactionRuleCollection
        .document(medcategory)
        .snapshots()
        .map(_interactionRuleFromSnapshot);
  }

  // westmeddatabase data from snapshot
  WestMedicine _westmeddatabaseFromSnapshot(DocumentSnapshot snapshot) {
    return WestMedicine(
      durgNo: snapshot.data['durgNo'],
      name: snapshot.data['name'],
      tags: snapshot.data['tags'],
      cureitem: snapshot.data['cureitem'],
      aftereffect: snapshot.data['aftereffect'],
      careitem: snapshot.data['careitem'],
      contradictions: snapshot.data['contradictions'],
      effect: snapshot.data['effect'],
      useway: snapshot.data['useway'],
      interaction: snapshot.data['interaction'],
    );
  }

  // resmedicine doc data from snapshot
  Resmedicine _resmedicineFromSnapshot(DocumentSnapshot snapshot) {
    return Resmedicine(
      westNo: snapshot.data['westNo'],
      westEnName: snapshot.data['westEnName'],
      category: snapshot.data['category'],
    );
  }

  // get resmedicine doc stream
  Stream<Resmedicine> get resmedicine {
    return westMedicineDatabaseCollection
        .document('resmedicine')
        .collection(diseasecategory)
        .document(medcategory)
        .snapshots()
        .map(_resmedicineFromSnapshot);
  }

  // resmedicineCategory data from snapshot
  Resmedicine _resmedicineCategoryFromSnapshot(DocumentSnapshot snapshot) {
    return Resmedicine(
        resMedCategoryList: snapshot.data['Category'],
        resMedChtCategoryList: snapshot.data['chtCategory']);
  }

  // get resmedicineCategory stream
  Stream<Resmedicine> get resmedicineCategory {
    return westMedicineDatabaseCollection
        .document('resmedicine')
        .snapshots()
        .map(_resmedicineCategoryFromSnapshot);
  }

  // update user westmedicine by array
  // update user westmedicine by subcollection
  // Future updateUesrMedicine(String drugNo) async {
  //   CollectionReference medRef = Firestore.instance.collection('brews').document(uid).collection('wesmed');
  //   return await medRef.document().setData({
  //     'drugNo': drugNo,
  //   });
  // }

  // // get user subcollection
  // Future getUserCollection() async {
  //   CollectionReference medRef = Firestore.instance.collection('brews').document(uid).collection('wesmed');
  //   return medRef;
  // }

  // // westmeddatabase list from snapshot
  // List<WestMedicine> _westmeddatabaseListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return WestMedicine(
  //       durgNo: doc.data['durgNo'] ?? 'No Data',
  //       name: doc.data['name'] ?? 'No Data',
  //       tags: doc.data['tags'] ?? 'No Data',
  //       cureitem: doc.data['cureitem'] ?? 'No Data',
  //       aftereffect: doc.data['aftereffect'] ?? 'No Data',
  //       careitem: doc.data['careitem'] ?? 'No Data',
  //       contradictions: doc.data['contradictions'] ?? 'No Data',
  //       effect: doc.data['effect'] ?? 'No Data',
  //       useway: doc.data['useway'] ?? 'No Data',
  //       interaction: doc.data['interaction'] ?? 'No Data',
  //     );
  //   }).toList();
  // }

}
