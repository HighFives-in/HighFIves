import 'package:flutter/material.dart';
import 'package:highfives_ui/screens/utils/topNavBarNotLoggedIn.dart';

class HowWeWork extends StatelessWidget {
  static const route = 'HowWeWork';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Theme.of(context).accentColor.withOpacity(0.05),
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Card(
              elevation: 2,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image(
                        image: AssetImage("assets/images/iconwithtext.png"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'How We Work ?',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildFeatures(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatures(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 400,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                    widthFactor: 0.55,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HighFives is an online platform that would help the training & placement cell and students of every college to handle pressurising phase of campus placements.',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Join us to ease your hiring process →',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ],
                      ),
                    )),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.5,
                  child: Image(
                    image: AssetImage("assets/images/static2.jpg"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                  width: 1,
                  color: Theme.of(context).accentColor.withOpacity(0.3)),
            )),
            height: 300,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                    widthFactor: 0.55,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Common Universal Platform for Placements',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'We bring hiring companies and colleges on the same platform \n and automate whole placement process.',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Manage everything at one place →',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ],
                      ),
                    )),
                FractionallySizedBox(
                  widthFactor: 0.45,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: AssetImage("assets/images/cartoon1.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                  width: 1,
                  color: Theme.of(context).accentColor.withOpacity(0.3)),
            )),
            height: 310,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                    widthFactor: 0.55,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Live Track the whole campus-placement process',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Streamlining whole placement process from inviting companies, \n registration to interview rounds and placement offers.',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Get Notifications for all events →',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ],
                      ),
                    )),
                FractionallySizedBox(
                  widthFactor: 0.45,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: AssetImage("assets/images/cartoon2.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                  width: 1,
                  color: Theme.of(context).accentColor.withOpacity(0.3)),
            )),
            height: 310,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                    widthFactor: 0.55,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Analytics and Automatic Scheduling',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Get Analytics for your all students and automatic Scheduling of \n multiple interviews, thus saving your hassle.',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Analytics for all students→',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ],
                      ),
                    )),
                FractionallySizedBox(
                  widthFactor: 0.45,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: AssetImage("assets/images/cartoon3.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                border: Border(
                  top: BorderSide(
                      width: 1,
                      color: Theme.of(context).accentColor.withOpacity(0.3)),
                )),
            height: 200,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SelectableText(
                      'If you have any questions, feel free message us at highfives@highfives.in . All right reserved.',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: SelectableText(
                      'To reach out on phone, Contact : 9569555585, 7986778923',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
