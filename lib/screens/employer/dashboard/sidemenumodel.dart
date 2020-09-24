import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/employerSideMenuItems.dart';
import 'package:highfives_ui/screens/employer/routes/allEmployerRoutes.dart';

class EmployerSideMenuModel extends ChangeNotifier {
  String _menuItem;
  int _selectedIndex;

  //singleton relationRoutes
  AllEmployerRoutesWithWidgets _allEmployerRoutesWithWidgets =
      AllEmployerRoutesWithWidgets.instance;

  EmployerSideMenuModel(String dynamicRoute) {
    _allEmployerRoutesWithWidgets.setRoute(dynamicRoute);
  }

  get selectedItem => _allEmployerRoutesWithWidgets.selectedItem;
  setSideMenuItem(String item) {
    if (_allEmployerRoutesWithWidgets.selectedItem == item) return;
    _selectedIndex = EMPLOYERSIDEMENULIST.indexOf(item);
    if (_selectedIndex < 0) Error();
    _menuItem = item;
    notifyListeners();
  }
}
