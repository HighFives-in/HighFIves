import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/screens/utils/bottombar.dart';
import 'package:highfives_ui/screens/utils/topNavBarNotLoggedIn.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:universal_html/js.dart' as js;

class HomeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              TopNavBarNotLoggedIn(),
              _buildHomeBody(context),
              BottomBarCommon(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeBody(BuildContext context) {
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
        SizedBox(height: 50),
        SizedBox(
          height: 500,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: 0.50,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image(
                    image: AssetImage("assets/images/static3.jpg"),
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
                    padding: EdgeInsets.all(60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100),
                        Text('Integrated platform for placements',
                            style: Theme.of(context).textTheme.headline2),
                        Text('Faster. Efficient. Secure.',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 30),
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              js.context.callMethod("open", [DEMO_FORM_LINK]);
                            },
                            child: Container(
                              height: 50,
                              child: Row(children: [
                                Text('Book Demo',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                Icon(Icons.trending_flat,
                                    color: Theme.of(context).primaryColor),
                              ]),
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
                    padding: EdgeInsets.all(60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100),
                        Text('Be prepared for anything',
                            style: Theme.of(context).textTheme.headline2),
                        Text(
                            'Never miss out on any opportunity.', //Get real time notifications and never miss out on any opportunity
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 30),
                        Container(
                          width: 130,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: null,
                            child: Container(
                              height: 50,
                              child: Row(children: [
                                Text('Explore  ',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                Icon(Icons.trending_flat,
                                    color: Theme.of(context).primaryColor),
                              ]),
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Image(
                      image: AssetImage("assets/images/static2.jpg"),
                      fit: BoxFit.contain,
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
                alignment: Alignment.topLeft,
                widthFactor: 0.50,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Image(
                      image: AssetImage("assets/images/static1.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 0.50,
                child: Container(
                  // color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100),
                        Text('Hire the best minds',
                            style: Theme.of(context).textTheme.headline2),
                        Text('Easily connect with college graduates.',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 30),
                        Container(
                          width: 130,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: null,
                            child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Text('Search  ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                  Icon(Icons.trending_flat,
                                      color: Theme.of(context).primaryColor),
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
        SizedBox(height: 50),
      ],
    );
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FractionallySizedBox(
                alignment: Alignment.bottomLeft,
                widthFactor: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: Image(
                      image: AssetImage("assets/images/static3.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Integrated platform for placements',
                            style: Theme.of(context).textTheme.headline3),
                        Text('Faster. Efficient. Secure.',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 30),
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              js.context.callMethod("open", [DEMO_FORM_LINK]);
                            },
                            child: Container(
                              height: 50,
                              child: Row(children: [
                                Text('Book Demo',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                Icon(Icons.trending_flat,
                                    color: Theme.of(context).primaryColor),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
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
                height: 20,
              ),
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Be prepared for anything',
                            style: Theme.of(context).textTheme.headline3),
                        Text('Never miss out on any opportunity.',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 30),
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: null,
                            child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Text('Explore  ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                  Icon(Icons.trending_flat,
                                      color: Theme.of(context).primaryColor),
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
              SizedBox(
                height: 50,
              ),
              FractionallySizedBox(
                alignment: Alignment.bottomLeft,
                widthFactor: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: Image(
                      image: AssetImage("assets/images/static1.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hire the best minds',
                            style: Theme.of(context).textTheme.headline3),
                        Text('Easily connect with the college graduates.',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 30),
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: null,
                            child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Text('Search  ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                  Icon(Icons.trending_flat,
                                      color: Theme.of(context).primaryColor),
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
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
