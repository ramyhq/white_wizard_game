import 'package:flutter/material.dart';
import 'package:white_wizard/const.dart';

const List<String> borgsList = [
  "الحوت ",
  "الحمل ",
  "الثور ",
  "الجوزاء ",
  "السرطان ",
  "الأسد ",
  "العزراء ",
  "الميزان ",
  "العقرب ",
  "القوس ",
  "الجدي ",
  "الدلو ",
];

List<DropdownMenuItem<String>> getDropdownItems() {
  List<DropdownMenuItem<String>> dropDownitemList = [];
  for (String borg in borgsList) {
    var newItem =
    DropdownMenuItem(
      alignment: AlignmentDirectional.center,
        child: Center(
          child: Text(
            borg,
            style: kTextStyle1,
          ),
        ),
        value: borg);
    dropDownitemList.add(newItem);
  }
  return dropDownitemList;
}

List<DropdownMenuItem<String>> getDropdownItems2() {
  List<DropdownMenuItem<String>> dropDownitemList = [];
  borgsList.forEach((element) {
    var newItem =
    DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        child: Center(
          child: Text(
            element,
            style: kTextStyle1,
          ),
        ),
        value: element);
    dropDownitemList.add(newItem);
  });

  return dropDownitemList;
}