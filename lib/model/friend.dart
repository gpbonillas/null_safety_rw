import 'abstract/person.dart';

class Friend extends Person {
  //1
  Friend(
      {required String name,
      required String surname,
      required String birthDate,
      required String gender,
      this.relation})
      : super(
            name: name, surname: surname, birthDate: birthDate, gender: gender);
  //2
  @override
  String whoAmI = 'a friend';
  String? relation;

  String? checkRelation() {
    //1
    if (relation != null) {
      return relation;
      //2
    } else {
      relationIsNotDefined();
    }
  }

  Never relationIsNotDefined() {
    throw ArgumentError('Friend relation is not defined');
  }
}
