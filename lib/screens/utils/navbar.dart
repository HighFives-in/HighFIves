import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/locator.dart';
import 'package:highfives_ui/screens/statics/howWeWork/howWeWork.dart';
import 'package:highfives_ui/screens/utils/navigationService.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:highfives_ui/utils/themeChanger.dart';
import 'package:provider/provider.dart';

class NavBarCommon extends StatelessWidget {
  double navBarHeight;
  NavBarCommon(this.navBarHeight);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: navBarHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.2),
              blurRadius: 3),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage("assets/images/iconwithtext.png"),
          ),
          InkWell(
            onTap: () {
              Provider.of<ThemeChanger>(context, listen: false).toggleTheme();
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.3),
                border:
                    Border.all(color: Theme.of(context).dividerColor, width: 1),
              ),
              child: Icon(Icons.brightness_3,
                  size: 40, color: Theme.of(context).accentColor),
            ),
          ),
          if (ResponsiveLayout.isSmallScreen(context))
            Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.menu,
                color: Theme.of(context).accentColor,
                size: 40,
              ),
            )
          else
            Row(
              children: [...getListOfNavHeadings(context)]..add(
                  InkWell(
                    onTap: () async {
                      //TODO ONCLICK
                      return null;
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(50, 30, 100, 30),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(8.3),
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 1.667),
                      ),
                      child: Center(
                        child: Text('Sign Up',
                            style: Theme.of(context).textTheme.headline5),
                      ),
                    ),
                  ),
                ),
            ),
        ],
      ),
    );
  }

  static List<Widget> getListOfNavHeadings(BuildContext context) {
    List<Widget> navHeadings = List<Widget>();
    Widget howWeWork = Container(
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          locator<NavigationService>().navitgateTo('/' + HowWeWork.route, null);
        },
        child: Text(NAV_HEADLINES[0],
            style: Theme.of(context).textTheme.headline4),
      ),
    );
    Widget aboutUs = Container(
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: () {},
        child: Text(NAV_HEADLINES[1],
            style: Theme.of(context).textTheme.headline4),
      ),
    );
    Widget blogs = Container(
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: () {},
        child: Text(NAV_HEADLINES[2],
            style: Theme.of(context).textTheme.headline4),
      ),
    );
    navHeadings.add(howWeWork);
    navHeadings.add(aboutUs);
    navHeadings.add(blogs);
    return navHeadings;
  }
}
