import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/constants/const/employerSideMenuItems.dart';
import 'package:highfives_ui/screens/employer/profile/employer_profile.dart';
import 'package:highfives_ui/screens/employer/relations/existing/existing.dart';
import 'package:highfives_ui/screens/employer/relations/existing/relationDetails.dart';
import 'package:highfives_ui/screens/employer/relations/new/buildNewRelations.dart';

//SINGLETON CLASS
class AllEmployerRoutesWithWidgets {
  String _dynamicRoute;
  AllEmployerRoutesWithWidgets._internal();
  String selectedItem;
  static final AllEmployerRoutesWithWidgets instance =
      AllEmployerRoutesWithWidgets._internal();
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
    print('FFF $routeUrl');
    //routes start with / so after split first element will be ""
    routeUrl.removeAt(0);
    if (routeUrl.length > 0) {
      if (isEmployerCommunicationRoute(routeUrl)) {
        //By Default  show existing relations
        //       /employer/communications || /employer/communications/
        this.selectedItem = EMPLOYER_COMMUNICATIONS;
        if (routeUrl.length == 3) {
          var idList = routeUrl[2].split('_');
          if (idList.length == 2) {
            this.currentWidget =
                ViewEmployerRelationDetails(int.parse(idList[0]));
          }
        } else if (routeUrl.length == 2 ||
            (routeUrl.length == 3 && routeUrl[2] == "")) {
          this.currentWidget = EmployerExistingRelations();
        } else if (routeUrl.length == 3 &&
                routeUrl[2] ==
                    EmployerExistingRelations.existingRelationsRoute ||
            routeUrl.length == 4 && routeUrl[3] == "") {
          this.currentWidget = EmployerExistingRelations();
        }
      }
      if (isEmployerStudentsRoute(routeUrl)) {
        this.selectedItem = EMPLOYER_STUDENTS;
        this.currentWidget = EmployerProfile();
      }
      if (isEmployerAnalyticsRoute(routeUrl)) {
        this.selectedItem = EMPLOYER_ANALYTICS;
        this.currentWidget = EmployerProfile();
      }
      if (isEmployerHelpRoute(routeUrl)) {
        this.selectedItem = EMPLOYER_HELP;
        this.currentWidget = EmployerProfile();
      }
      if (buildNewRelationRoute(routeUrl)) {
        this.selectedItem = EMPLOYER_BUILD_NEW_RELATIONS;
        this.currentWidget = BuildNewRelations();
      }
      if (isEmployerProfileRoute(routeUrl)) {
        this.selectedItem = EMPLOYER_PROFILE;
        this.currentWidget = EmployerProfile();
      }
    } else {
      print('NO ROUTE FOUND');
      this.currentWidget = EmployerProfile();
    }
  }

  getSelectedItem() {
    return this.selectedItem;
  }

  static buildNewRelationRoute(List routeUrl) {
    if (routeUrl.length == 2 && routeUrl[1] != null) {
      if (routeUrl[1].split('%20').join(' ') == EMPLOYER_BUILD_NEW_RELATIONS)
        return true;
    }
    if (routeUrl == null && routeUrl.length == 0) return false;
    if ((routeUrl.length == 2 &&
        routeUrl[0] == EMPLOYER &&
        routeUrl[1] == EMPLOYER_BUILD_NEW_RELATIONS)) {
      return true;
    }
    return false;
  }

  static isEmployerStudentsRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if ((routeUrl.length == 2 &&
        routeUrl[0] == EMPLOYER &&
        routeUrl[1] == EMPLOYER_STUDENTS)) {
      return true;
    }
    return false;
  }

  static isEmployerAnalyticsRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if ((routeUrl.length == 2 &&
        routeUrl[0] == EMPLOYER &&
        routeUrl[1] == EMPLOYER_ANALYTICS)) {
      return true;
    }
    return false;
  }

  static isEmployerHelpRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if ((routeUrl.length == 2 &&
        routeUrl[0] == EMPLOYER &&
        routeUrl[1] == EMPLOYER_HELP)) {
      return true;
    }
    return false;
  }

  static isEmployerCommunicationRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if (routeUrl.length > 1 &&
        routeUrl[0] == EMPLOYER &&
        routeUrl[1] == EMPLOYER_COMMUNICATIONS) {
      return true;
    }
    return false;
  }

  //BY DEFAULT PROFILE SO THIS IS FLEXIBLE ROUTE
  static isEmployerProfileRoute(List routeUrl) {
    if (routeUrl == null && routeUrl.length == 0) return false;
    if (routeUrl.length > 2) return false;
    if (routeUrl.length == 1 && routeUrl[0] == EMPLOYER ||
        (routeUrl.length == 1 &&
            routeUrl[0] == EMPLOYER &&
            routeUrl.length == 2 &&
            routeUrl[1] == EMPLOYER_PROFILE) ||
        routeUrl.length == 2 && routeUrl[1] == "" ||
        (routeUrl.length == 2 &&
            routeUrl[0] == EMPLOYER &&
            routeUrl[1] == EMPLOYER_PROFILE)) {
      return true;
    }
    return false;
  }
}
