import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/tnpSideMenuItems.dart';
import 'package:highfives_ui/screens/tnp/allTnpRoutes.dart';

//MANAGES DASHBOARD BODY AND SETS DYAMIC ROUTES WITH DIFFERENT SUB ROUTES
class SideMenuModel extends ChangeNotifier {
  String _menuItem;
  int _selectedIndex;
  //singleton relationRoutes
  AllTNPRoutesWithWidgets _allTNPRoutesWithWidgets =
      AllTNPRoutesWithWidgets.instance;
  SideMenuModel(String dynamicRoute) {
    _allTNPRoutesWithWidgets.setRoute(dynamicRoute);
  }

  get selectedItem => _allTNPRoutesWithWidgets.selectedItem != null
      ? _allTNPRoutesWithWidgets.selectedItem
      : TNP_PROFILE;
  setSideMenuItem(String item) {
    if (_allTNPRoutesWithWidgets.selectedItem == item) return;
    _selectedIndex = TNPSIDEMENULIST.indexOf(item);
    if (_selectedIndex < 0) Error();
    _menuItem = item;
    notifyListeners();
  }
}
