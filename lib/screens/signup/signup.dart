import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/screens/login/login.dart';
import 'package:highfives_ui/screens/signup/logic.dart';
import 'package:highfives_ui/screens/utils/bottombar.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:highfives_ui/utils/themeChanger.dart';
import 'package:provider/provider.dart';

class SignupUI extends StatelessWidget {
  ThemeChanger _themeChanger;
  @override
  Widget build(BuildContext context) {
    _themeChanger = Provider.of<ThemeChanger>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).primaryColor,
          child: ListView(
            children: [
              _buildTopNavBar(context),
              _buildSignupBody(context),
              BottomBarCommon(size),
            ],
          )),
    );
  }

  Widget _buildTopNavBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.2),
              blurRadius: 3),
        ],
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage("assets/images/iconwithtext.png"),
          ),
          InkWell(
            onTap: () {
              _themeChanger.toggleTheme();
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginUI()));
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
                        child: Text('Log In',
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

  List<Widget> getListOfNavHeadings(BuildContext context) {
    return NAV_HEADLINES.map((headline) {
      return Padding(
        padding: EdgeInsets.fromLTRB(40, 30, 0, 30),
        child: Text(headline, style: Theme.of(context).textTheme.headline4),
      );
    }).toList();
  }

  Widget _buildSignupBody(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}

class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 700,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                alignment: Alignment.bottomLeft,
                widthFactor: 0.5,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Image(
                    image: AssetImage("assets/images/static2.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 0.5,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        Text('Lets do highfives !',
                            style: Theme.of(context).textTheme.headline2),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Don\'t miss out an opportunity ',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        SizedBox(height: 30),
                        SignupLogic(),
                        //submit login
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lets do highfives !',
                      style: Theme.of(context).textTheme.headline2),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Don\'t miss out an opportunity ',
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  SizedBox(height: 30), //submit login
                ],
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              widthFactor: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Image(
                    image: AssetImage("assets/images/static2.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: SignupLogic(),
            ),
          ],
        ),
      ),
    );
  }
}
