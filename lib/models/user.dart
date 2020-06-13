class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String birthday;
  final String gender;
  final double height;
  final double weight;
  final dynamic westmed;
  final List chinesemed;
  final List food;

  UserData(
      {this.uid,
      this.name,
      this.birthday,
      this.gender,
      this.height,
      this.weight,
      this.westmed,
      this.chinesemed,
      this.food});
}
