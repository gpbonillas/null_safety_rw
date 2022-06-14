import 'abstract/person.dart';

class FamilyMember extends Person {
  String? profession;

  FamilyMember(
      {required String name,
      required String surname,
      required String birthDate,
      required String gender,
      this.profession})
      : super(
            name: name, surname: surname, birthDate: birthDate, gender: gender);

  @override
  String whoAmI = 'a family member';
}
