import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/size.dart';
import 'package:highfives_ui/screens/tnp/allTnpRoutes.dart';
import 'package:highfives_ui/screens/tnp/dashboard/sideview.dart';
import 'package:highfives_ui/screens/tnp/dashboard/sidemenumodel.dart';
import 'package:highfives_ui/screens/utils/navbar.dart';
import 'package:provider/provider.dart';

class TnpView extends StatelessWidget {
  static const String tnpMainRoute = 'tnp';
  String dynamicRoute;
  TnpView(this.dynamicRoute);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SideMenuModel>(
      //By default build Profile
      create: (_) => SideMenuModel(this.dynamicRoute),
      child: TnpDashBoard(),
    );
  }
}

class TnpDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Now get the menu item selected on basis of sideMenu and build sideView and dashboard body
    final item = Provider.of<SideMenuModel>(context).selectedItem;
    Size size = MediaQuery.of(context).size;
    double navBarHeight = 100;
    return Builder(
      builder: (context) {
        return Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            child: ListView(
              children: [
                NavBarCommon(navBarHeight),
                Container(
                  width: size.width,
                  height: size.height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SideView(),
                      DashBoardBody(item),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DashBoardBody extends StatelessWidget {
  String _menuItem;
  AllTNPRoutesWithWidgets _allTNPRoutesWithWidgets =
      AllTNPRoutesWithWidgets.instance;
  DashBoardBody(this._menuItem);
  @override
  Widget build(BuildContext context) {
    return _getSelectedWidget(_menuItem, context);
  }

  Widget _getSelectedWidget(String menuItem, BuildContext context) {
    Widget childWidget = _allTNPRoutesWithWidgets.currentWidget;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - SIDE_VIEW_WIDTH,
      height: size.height,
      // padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor.withOpacity(0.05),
      ),
      child: childWidget,
    );
  }
}
