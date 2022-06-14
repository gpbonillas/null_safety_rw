import 'abstract/person.dart';

class User extends Person {

  User(
      {required String name,
      required String surname,
      required String birthDate,
      required String gender})
      : super(
            name: name, surname: surname, birthDate: birthDate, gender: gender);

  late List friendsAndFamily;

  @override
  String whoAmI = ' a user';

}
