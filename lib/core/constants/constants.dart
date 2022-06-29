import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

String fruitsUrl = 'assets/images/fruits/';
String localizationUrl = 'assets/localization';
List<String> fruits = [
  'apple',
  'banana',
  'grape',
  'kiwi',
  'orange',
  'strawberry',
];
String questionMarkUrl = 'assets/images/QuestionMark.png';

TextStyle textStyleWhite = const TextStyle(fontSize: 24, color: Colors.white);

BoxDecoration backgroundDecoration = const BoxDecoration(
    gradient: LinearGradient(
  colors: [Color.fromARGB(255, 35, 10, 56), Color.fromARGB(255, 238, 85, 34)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
));

List<DropdownMenuItem<Locale>> localizationDropDownItems = [
  DropdownMenuItem(
    value: const Locale('tr'),
    child: Row(
      children: const [
        Flag.fromString('TR', height: 20, width: 35),
        Text('Türkçe'),
      ],
    ),
  ),
  DropdownMenuItem(
    value: const Locale('en'),
    child: Row(
      children: const [
        Flag.fromString('GB', height: 20, width: 35),
        Text('English'),
      ],
    ),
  ),
];

BoxDecoration langSelectorBoxDecoration = BoxDecoration(
    color: const Color.fromARGB(255, 251, 110, 30),
    borderRadius: BorderRadius.circular(8));

BoxDecoration flipCardBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: const Color.fromARGB(255, 251, 110, 30));
