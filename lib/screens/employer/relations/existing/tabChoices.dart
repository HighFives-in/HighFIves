import 'package:flutter/material.dart';

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> tabsChoiceList = <Choice>[
  Choice(title: 'Job Details', icon: Icons.ac_unit),
  Choice(title: 'Communications', icon: Icons.chat),
  Choice(title: 'Volunteer', icon: Icons.people),
];
