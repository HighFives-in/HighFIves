import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/screens/login/logic.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:highfives_ui/utils/themeChanger.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../login/login.dart';

class HOMEUI extends StatelessWidget {

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopNavBar(context),
              _buildHomeBody(context),
              _buildBottomBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeBottom(),
      smallScreen: SmallBottom(),
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
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
              Text(
                COMPANY_NAME,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
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
              children: [...getListOfNavHeadings(context),
                  InkWell(
                    onTap: () async {
                      //TODO ONCLICK
                      return null;
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(40, 30, 0, 30),
                      width: 80,
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
                  InkWell(
                      onTap: () async {
                        //TODO ONCLICK
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => LoginUI()));
                        return null;
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(40, 30, 50, 30),
                        width: 80,
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
              ]
            ),
        ],
      ),
    );
  }

  List<Widget> getListOfNavHeadings(BuildContext context) {
    return NAV_HEADLINES.map((headline) {
      return Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
        child: Text(headline, style: Theme.of(context).textTheme.headline4),
      );
    }).toList();
  }

  Widget _buildHomeBody(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }

}

class LargeBottom extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
            width: size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Column(
                            children: [
                                  SizedBox(height: 40,),
                                  Text('HighFives', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 40,),
                                  FlatButton(
                                    onPressed: () {},
                                      textColor: Theme.of(context).primaryColor,
                                      child: Text('Help'),
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('FAQ'),
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('Contact Us'),
                                  ),
                                  SizedBox(height: 40,),
                                ]
                            ),
                    Column(
                                children: [
                                  SizedBox(height: 40,),
                                  Text('Company', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 40,),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('About Us'),
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('Careers'),
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('Terms & Policies'),
                                  ),
                                  SizedBox(height: 40,),
                                ]
                              ),
                      Column(
                        children: [
                          SizedBox(height: 40,),
                          Text('Social', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                          SizedBox(height: 40),
                      Row(
                          children: [
                            FlatButton(
                              onPressed: () {},
                                child: FaIcon(FontAwesomeIcons.facebookSquare, size: 40, color: Theme.of(context).primaryColor),
                            ),
                            FlatButton(
                              onPressed: () {},
                                child: FaIcon(FontAwesomeIcons.instagramSquare, size: 40, color: Theme.of(context).primaryColor),
                            ),
                            FlatButton(
                              onPressed: () {},
                                child: FaIcon(FontAwesomeIcons.linkedinIn, size: 40, color: Theme.of(context).primaryColor),
                            ),
                          ]
                        ),
                        SizedBox(height: 40),
                                                ],
                      ),
                      Column(children: [
                        SizedBox(height: 40,),
                          Text('Support', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                          SizedBox(height: 40),
                          FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('help@highfives.in'),
                                  ),
                                  SizedBox(height: 40,),
                      ],)

              ],
              ),

            );
  }
}

class SmallBottom extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
            width: size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Column(
                            children: [
                                  SizedBox(height: 20,),
                                  Text('HighFives', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 20,),
                                  FlatButton(
                                    onPressed: () {},
                                      textColor: Theme.of(context).primaryColor,
                                      child: Text('Help'),
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('FAQ'),
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('Contact Us'),
                                  ),
                                  SizedBox(height: 20,),

                                   SizedBox(height: 20,),
                          Text('Social', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                      Row(
                          children: [
                            FlatButton(
                              onPressed: () {},
                                child: FaIcon(FontAwesomeIcons.facebookSquare, size: 20, color: Theme.of(context).primaryColor),
                            ),
                            FlatButton(
                              onPressed: () {},
                                child: FaIcon(FontAwesomeIcons.instagramSquare, size: 20, color: Theme.of(context).primaryColor),
                            ),
                            FlatButton(
                              onPressed: () {},
                                child: FaIcon(FontAwesomeIcons.linkedinIn, size: 20, color: Theme.of(context).primaryColor),
                            ),
                          ]
                        ),
                        SizedBox(height: 20),
                                ]
                            ),
                    Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Text('Company', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 20,),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('About Us'),
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('Careers'),
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    textColor: Theme.of(context).primaryColor,
                                      child: Text('Terms & Policies'),
                                  ),
                                  SizedBox(height: 20,),
                                   SizedBox(height: 20,),
                                  Text('Support', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 20),
                                  FlatButton(
                                            onPressed: () {},
                                            textColor: Theme.of(context).primaryColor,
                                              child: Text('help@highfives.in'),
                                          ),
                                  SizedBox(height: 20,),
                                ]
                              ),
              ],
              ),

            );
  }
}


class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        SizedBox(
          height: 500,
          child: Stack(
            fit: StackFit.expand,
            children: [
                      FractionallySizedBox(
                        alignment: Alignment.topLeft,
                        widthFactor: 0.50,
                        child: Container(
                          child: Image(
                            image: AssetImage("assets/images/static_home.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.centerRight,
                        widthFactor: 0.50,
                        child: Container(
                          // color: Colors.green,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 100),
                                Text('Integrated platform for placements',
                                  style: Theme.of(context).textTheme.headline2),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Faster. Efficient. Secure.',
                                        style: Theme.of(context).textTheme.headline6),
                                ),
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7),
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FlatButton(
                                      onPressed: null,
                                      child: Row(
                                        children : [
                                          Text('Take a tour  ', style: Theme.of(context).textTheme.headline5),
                                          Icon(Icons.trending_flat, color: Theme.of(context).primaryColor),
                                        ]
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                ],
              ),
          ),
          SizedBox(
          height: 500,
          child: Stack(
            fit: StackFit.expand,
            children: [
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.50,
                        child: Container(
                          // color: Colors.green,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 100),
                                Text('Be prepared for anything',
                                  style: Theme.of(context).textTheme.headline2),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Never miss out on any opportunity.', //Get real time notifications and never miss out on any opportunity
                                        style: Theme.of(context).textTheme.headline6),
                                ),
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7),
                                  child: Container(
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FlatButton(
                                      onPressed: null,
                                      child: Row(
                                        children: [
                                          Text('Explore  ', style: Theme.of(context).textTheme.headline5),
                                          Icon(Icons.trending_flat, color: Theme.of(context).primaryColor),
                                        ]
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.topRight,
                        widthFactor: 0.50,
                        child: Container(
                          child: Image(
                            image: AssetImage("assets/images/static2.jpg"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                ],
              ),
          ),
          SizedBox(
          height: 500,
          child: Stack(
            fit: StackFit.expand,
            children: [
                      FractionallySizedBox(
                        alignment: Alignment.topLeft,
                        widthFactor: 0.50,
                        child: Container(
                          child: Image(
                            image: AssetImage("assets/images/static1.jpg"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.centerRight,
                        widthFactor: 0.50,
                        child: Container(
                          // color: Colors.green,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 100),
                                Text('Hire the best minds',
                                  style: Theme.of(context).textTheme.headline2),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Easily connect with college graduates.',
                                        style: Theme.of(context).textTheme.headline6),
                                ),
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7),
                                  child: Container(
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FlatButton(
                                      onPressed: null,
                                      child: Row(
                                        children: [
                                          Text('Search  ', style: Theme.of(context).textTheme.headline5),
                                          Icon(Icons.trending_flat, color: Theme.of(context).primaryColor),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                ],
              ),
          ),
          SizedBox(
            height: 50
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
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              widthFactor: 0.8,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Image(
                    image: AssetImage("assets/images/static_home.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // FractionallySizedBox(
            //   alignment: Alignment.centerRight,
            //   widthFactor: 1,
            //   child: Container(
            //     // color: Colors.green,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text('Welcome back !',
            //             style: Theme.of(context).textTheme.headline2),
            //         Padding(
            //           padding: EdgeInsets.all(10),
            //           child: Text('Don\'t miss out an opportunity ',
            //               style: Theme.of(context).textTheme.headline6),
            //         ),
            //         SizedBox(height: 30), //submit login
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            FractionallySizedBox(
                        alignment: Alignment.centerRight,
                        widthFactor: 1,
                        child: Container(
                          // color: Colors.green,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Integrated platform for placements',
                                  style: Theme.of(context).textTheme.headline3),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Faster. Efficient. Secure.',
                                        style: Theme.of(context).textTheme.headline6),
                                ),
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7),
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FlatButton(
                                      onPressed: null,
                                      child: Row(
                                        children : [
                                          Text('Take a tour  ', style: Theme.of(context).textTheme.headline5),
                                          Icon(Icons.trending_flat, color: Theme.of(context).primaryColor),
                                        ]
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                         FractionallySizedBox(
                            alignment: Alignment.bottomLeft,
                            widthFactor: 0.8,
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
                        alignment: Alignment.centerRight,
                        widthFactor: 1,
                        child: Container(
                          // color: Colors.green,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Be prepared for anything',
                                  style: Theme.of(context).textTheme.headline3),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Never miss out on any opportunity.',
                                        style: Theme.of(context).textTheme.headline6),
                                ),
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7),
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FlatButton(
                                      onPressed: null,
                                      child: Row(
                                        children : [
                                          Text('Explore  ', style: Theme.of(context).textTheme.headline5),
                                          Icon(Icons.trending_flat, color: Theme.of(context).primaryColor),
                                        ]
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                         FractionallySizedBox(
                            alignment: Alignment.bottomLeft,
                            widthFactor: 0.8,
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
                        alignment: Alignment.centerRight,
                        widthFactor: 1,
                        child: Container(
                          // color: Colors.green,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hire the best minds',
                                  style: Theme.of(context).textTheme.headline3),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Easily connect with the college graduates.',
                                        style: Theme.of(context).textTheme.headline6),
                                ),
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7),
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FlatButton(
                                      onPressed: null,
                                      child: Row(
                                        children : [
                                          Text('Search  ', style: Theme.of(context).textTheme.headline5),
                                          Icon(Icons.trending_flat, color: Theme.of(context).primaryColor),
                                        ]
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
          ],
        ),
      ),
    );
  }
}


