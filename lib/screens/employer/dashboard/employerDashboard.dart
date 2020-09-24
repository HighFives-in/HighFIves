import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/employerSideMenuItems.dart';
import 'package:highfives_ui/constants/const/size.dart';
import 'package:highfives_ui/screens/employer/dashboard/employerSideview.dart';
import 'package:highfives_ui/screens/employer/dashboard/sidemenumodel.dart';
import 'package:highfives_ui/screens/employer/profile/employer_profile.dart';
import 'package:highfives_ui/screens/utils/navbar.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:provider/provider.dart';

class EmployerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<EmployerSideMenuModel>(
      //By default build Profile
      create: (_) => EmployerSideMenuModel(0),
      child: EmployerDashBoard(),
    );
  }
}

class EmployerDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Now get the menu item selected on basis of sideMenu and build sideView and dashboard body
    final item = Provider.of<EmployerSideMenuModel>(context).selectedItem;
    Size size = MediaQuery.of(context).size;
    double navBarHeight = 100;
    return Builder(
      builder: (context) {
        return new Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            child: ListView(
              children: [
                NavBarCommon(navBarHeight),
                Container(
                  width: size.width,
                  height: size.height,
                  child: _buildResponsiveDashBoard(context, item),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildResponsiveDashBoard(BuildContext context, String item) {
    if (ResponsiveLayout.isSmallScreen(context)) {
      //TODO SHOW A IMAGE OF SIDE MENU SO THAT IT CAN BE OPENED WITH A CLICK
      return Row(
        children: [
          DashBoardBody(item),
        ],
      );
    } else {
      return Row(
        children: [
          EmployerSideView(),
          DashBoardBody(item),
        ],
      );
    }
  }
}

class DashBoardBody extends StatelessWidget {
  String _menuItem;
  DashBoardBody(this._menuItem);
  @override
  Widget build(BuildContext context) {
    return _getSelectedWidget(_menuItem, context);
  }
}

Widget _getSelectedWidget(String menuItem, BuildContext context) {
  Widget childWidget;

  //TODO THIS COMMUNICATION HAS SOME CATEGORIES

  if (menuItem != null && menuItem == EMPLOYER_PROFILE) {
    childWidget = EmployerProfile();
  }

  Size size = MediaQuery.of(context).size;
  final widthConsideringResponsive =
      ResponsiveLayout.isSmallScreen(context) ? 0 : SIDE_VIEW_WIDTH;
  return Container(
    width: size.width - widthConsideringResponsive,
    height: size.height,
    // padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Theme.of(context).accentColor.withOpacity(0.05),

      // boxShadow: [
      //   BoxShadow(
      //     blurRadius: 3,
      //   ),
      // ],
    ),
    // color: Theme.of(context).accentColor.withOpacity(0.05),
    // padding: EdgeInsets.all(40),
    child: childWidget,
  );

  // if (menuItem != null && menuItem == SIDEMENULIST[2]) {
  //   return BuildOnGoingInterview();
  // }
  // if (menuItem != null && menuItem == SIDEMENULIST[3]) {
  //   return BuildStudentsView();
  // }
  // if (menuItem != null && menuItem == SIDEMENULIST[4]) {
  //   return BuildAnalytics();
  // }
  // if (menuItem != null && menuItem == SIDEMENULIST[5]) {
  //   return BuildHelp();
  // }
}
