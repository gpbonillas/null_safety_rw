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
import 'package:profile_app/utils/const.dart';

class OurDropDownWidget extends StatefulWidget{
  String _dropDownValue;
  List<String> _values;
  Function _onValueChanged;
  OurDropDownWidget(this._dropDownValue,this._values,this._onValueChanged);
  @override
  State<StatefulWidget> createState() {
    return _OurDropDownState();
  }
}


class _OurDropDownState extends State<OurDropDownWidget>{

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(
            ProjectConst.value10,
            ProjectConst.value5,
            ProjectConst.value10,
            ProjectConst.value5),
        padding: const EdgeInsets.fromLTRB(
            ProjectConst.value20,
            ProjectConst.value0,
            ProjectConst.value20,
            ProjectConst.value0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(ProjectConst.value02),
          borderRadius:
          BorderRadius.circular(ProjectConst.value22),
        ),
        child: DropdownButtonFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            value: widget._dropDownValue,
            onChanged: (String? newValue) {
              widget._onValueChanged(newValue!);
            },
            items: widget._values.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()));
  }


}