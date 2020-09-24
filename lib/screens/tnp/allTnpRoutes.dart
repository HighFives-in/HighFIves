import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/constants/const/tnpSideMenuItems.dart';
import 'package:highfives_ui/screens/tnp/profile/profile.dart';
import 'package:highfives_ui/screens/tnp/relations/existing/existing.dart';
import 'package:highfives_ui/screens/tnp/relations/existing/relationDetails.dart';

//SINGLETON CLASS
class AllTNPRoutesWithWidgets {
  String _dynamicRoute;
  AllTNPRoutesWithWidgets._internal();
  String selectedItem;
  static final AllTNPRoutesWithWidgets instance =
      AllTNPRoutesWithWidgets._internal();
  //all widgets inside relation category
  Widget currentWidget;

  get getcurrentWidget {
    return this.currentWidget;
  }

  get route => this._dynamicRoute;

  setRoute(String route) {
    if (route == null) return;
    this._dynamicRoute = route;
    var routeUrl = route.split('/');

    //routes start with / so after split first element will be ""
    routeUrl.removeAt(0);

    if (routeUrl.length > 0) {
      if (isCommunicationRoute(routeUrl)) {
        //By Default  show existing relations
        //       /tnp/communications || /tnp/communications/
        this.selectedItem = COMMUNICATIONS;
        if (routeUrl.length == 3) {
          var idList = routeUrl[2].split('_');
          if (idList.length == 2) {
            this.currentWidget =
                ViewRelationDetails(int.parse(idList[0]), int.parse(idList[1]));
          }
        } else if (routeUrl.length == 2 ||
            (routeUrl.length == 3 && routeUrl[2] == "")) {
          this.currentWidget = ExistingRelations();
        } else if (routeUrl.length == 3 &&
                routeUrl[2] == ExistingRelations.existingRelationsRoute ||
            routeUrl.length == 4 && routeUrl[3] == "") {
          this.currentWidget = ExistingRelations();
        }
      }
      if (isStudentsRoute(routeUrl)) {
        this.selectedItem = STUDENTS;
        this.currentWidget = TnpProfile();
      }
      if (isAnalyticsRoute(routeUrl)) {
        this.selectedItem = ANALYTICS;
        this.currentWidget = TnpProfile();
      }
      if (isHelpRoute(routeUrl)) {
        this.selectedItem = HELP;
        this.currentWidget = TnpProfile();
      }
      if (isProfileRoute(routeUrl)) {
        this.selectedItem = TNP_PROFILE;
        this.currentWidget = TnpProfile();
      }
    } else {
      print('NO ROUTE FOUND');
      this.currentWidget = TnpProfile();
    }
  }

  getSelectedItem() {
    return this.selectedItem;
  }

  static isStudentsRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if ((routeUrl.length == 2 &&
        routeUrl[0] == TNP &&
        routeUrl[1] == STUDENTS)) {
      return true;
    }
    return false;
  }

  static isAnalyticsRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if ((routeUrl.length == 2 &&
        routeUrl[0] == TNP &&
        routeUrl[1] == ANALYTICS)) {
      return true;
    }
    return false;
  }

  static isHelpRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if ((routeUrl.length == 2 && routeUrl[0] == TNP && routeUrl[1] == HELP)) {
      return true;
    }
    return false;
  }

  static isCommunicationRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if (routeUrl.length > 1 &&
        routeUrl[0] == TNP &&
        routeUrl[1] == COMMUNICATIONS) {
      return true;
    }
    return false;
  }

  //BY DEFAULT PROFILE SO THIS IS FLEXIBLE ROUTE
  static isProfileRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if (routeUrl.length > 2) return false;
    if (routeUrl.length == 1 && routeUrl[0] == TNP ||
        (routeUrl.length == 1 &&
            routeUrl[0] == TNP &&
            routeUrl.length == 2 &&
            routeUrl[1] == TNP_PROFILE) ||
        routeUrl.length == 2 && routeUrl[1] == "" ||
        (routeUrl.length == 2 &&
            routeUrl[0] == TNP &&
            routeUrl[1] == TNP_PROFILE)) {
      return true;
    }
    return false;
  }
}
