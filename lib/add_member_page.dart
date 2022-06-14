///
///
/// Copyright (c) 2021 Razeware LLC
/// Permission is hereby granted, free of charge, to any person
/// obtaining a copy of this software and associated documentation
/// files (the "Software"), to deal in the Software without
/// restriction, including without limitation the rights to use,
/// copy, modify, merge, publish, distribute, sublicense, and/or
/// sell copies of the Software, and to permit persons to whom
/// the Software is furnished to do so, subject to the following
/// conditions:

/// The above copyright notice and this permission notice shall be
/// included in all copies or substantial portions of the Software.

/// Notwithstanding the foregoing, you may not use, copy, modify,
/// merge, publish, distribute, sublicense, create a derivative work,
/// and/or sell copies of the Software in any work that is designed,
/// intended, or marketed for pedagogical or instructional purposes
/// related to programming, coding, application development, or
/// information technology. Permission for such use, copying,
/// modification, merger, publication, distribution, sublicensing,
/// creation of derivative works, or sale is expressly withheld.

/// This project and source code may use libraries or frameworks
/// that are released under various Open-Source licenses. Use of
/// those libraries and frameworks are governed by their own
/// individual licenses.

/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
/// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
/// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
/// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
/// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
/// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
///

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profile_app/utils/data_manager.dart';
import 'package:profile_app/utils/widgets/our_button_widget.dart';
import 'package:profile_app/utils/widgets/our_dropdown_widget.dart';
import 'package:profile_app/utils/widgets/our_image_widget.dart';
import 'package:profile_app/utils/widgets/our_text_field_widget.dart';
import 'model/abstract/person.dart';
import 'model/family_member.dart';
import 'model/friend.dart';
import 'utils/const.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddMemberPageState();
  }
}

class _AddMemberPageState extends State<AddMemberPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _birthDateController;
  late final TextEditingController _professionController;
  late final TextEditingController _friendController;

  String _dropDownGender = ProjectConst.FEMALE;
  String _dropDownMember = ProjectConst.FRIEND;
  String _genderImage = ProjectConst.FEMALE_IMAGE;
  bool _isProfessionVisible = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _birthDateController = TextEditingController();
    _professionController = TextEditingController();
    _friendController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(ProjectConst.ADD_MEMBER),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OurImageWidget(_genderImage),
                  OurTextFieldWidget(_nameController, ProjectConst.NAME),
                  OurTextFieldWidget(_surnameController, ProjectConst.SURNAME),
                  OurTextFieldWidget(
                      _birthDateController, ProjectConst.BIRTH_DATE),
                  OurDropDownWidget(
                      ProjectConst.FEMALE,
                      [
                        ProjectConst.MALE,
                        ProjectConst.FEMALE,
                        ProjectConst.OTHER
                      ],
                      _onGenderSelected),
                  OurDropDownWidget(
                      ProjectConst.FRIEND,
                      [ProjectConst.FRIEND, ProjectConst.FAMILY_MEMBER],
                      _onFamilyOrFriendSelected),
                  Visibility(
                    child: OurTextFieldWidget(
                        _professionController, ProjectConst.PROFESSION),
                    visible: _isProfessionVisible,
                  ),
                  Visibility(
                    child: OurTextFieldWidget(
                        _friendController, ProjectConst.FRIEND_RELATION),
                    visible: !_isProfessionVisible,
                  ),
                ],
              )),
              OurButtonWidget(_addMember, ProjectConst.ADD_MEMBER)
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _birthDateController.dispose();
    _professionController.dispose();
    _friendController.dispose();
  }

  void _onGenderSelected(String newValue) {
    setState(() {
      _dropDownGender = newValue;
      if (_dropDownGender.toLowerCase() == ProjectConst.MALE) {
        _genderImage = ProjectConst.MALE_IMAGE;
      } else if (_dropDownGender.toLowerCase() == ProjectConst.FEMALE) {
        _genderImage = ProjectConst.FEMALE_IMAGE;
      } else {
        _genderImage = ProjectConst.FEMALE_MALE_IMAGE;
      }
    });
  }

  void _onFamilyOrFriendSelected(String newValue) {
    setState(() {
      _dropDownMember = newValue;
      if (_dropDownMember == ProjectConst.FRIEND) {
        _isProfessionVisible = false;
      } else {
        _isProfessionVisible = true;
      }
    });
  }

  void _addMember() {
    //1
    late final Person _person;
    final name = _nameController.text;
    final surname = _surnameController.text;
    final birthDate = _birthDateController.text;
    final gender = _dropDownGender;
    final profession = _professionController.text;
    final friendRelation = _friendController.text;
    //2
    if (_dropDownMember.contains(ProjectConst.FAMILY_MEMBER)) {
      _person = FamilyMember(
        name: name,
        surname: surname,
        birthDate: birthDate,
        gender: gender,
        profession: profession.isEmpty ? null : profession,
      );
    } else {
      _person = Friend(
          name: name,
          surname: surname,
          birthDate: birthDate,
          gender: gender,
          relation: friendRelation.isEmpty ? null : friendRelation);

      // (_person as Friend).checkRelation();
    }
    //3
    DataManager.addPerson(_person);

    Navigator.pop(context);
  }
}
