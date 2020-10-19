import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';

class BottomBarCommon extends StatelessWidget {
  Size bottomBarHeight;
  BottomBarCommon(this.bottomBarHeight);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeBottom(),
      smallScreen: SmallBottom(),
    );
  }
}

class LargeBottom extends StatelessWidget {
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
          Column(children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'HighFives',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 40,
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Help', style: Theme.of(context).textTheme.headline5),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('FAQ', style: Theme.of(context).textTheme.headline5),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Contact Us',
                  style: Theme.of(context).textTheme.headline5),
            ),
            SizedBox(
              height: 40,
            ),
          ]),
          Column(children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Company',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 40,
            ),
            FlatButton(
              onPressed: () {},
              child: Text('About Us',
                  style: Theme.of(context).textTheme.headline5),
            ),
            FlatButton(
              onPressed: () {},
              child:
                  Text('Careers', style: Theme.of(context).textTheme.headline5),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Terms & Policies',
                  style: Theme.of(context).textTheme.headline5),
            ),
            SizedBox(
              height: 40,
            ),
          ]),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Social',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 40),
              Row(children: [
                FlatButton(
                  onPressed: () {},
                  child: FaIcon(FontAwesomeIcons.facebookSquare,
                      size: 40, color: Theme.of(context).primaryColor),
                ),
                FlatButton(
                  onPressed: () {},
                  child: FaIcon(FontAwesomeIcons.instagramSquare,
                      size: 40, color: Theme.of(context).primaryColor),
                ),
                FlatButton(
                  onPressed: () {},
                  child: FaIcon(FontAwesomeIcons.linkedinIn,
                      size: 40, color: Theme.of(context).primaryColor),
                ),
              ]),
              SizedBox(height: 40),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Support',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 40),
              FlatButton(
                onPressed: () {},
                child: Text('highfives.in@gmail.com',
                    style: Theme.of(context).textTheme.headline5),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SmallBottom extends StatelessWidget {
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
          Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'HighFives',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 20,
            ),
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
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Social',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 20),
            Row(children: [
              FlatButton(
                onPressed: () {},
                child: FaIcon(FontAwesomeIcons.facebookSquare,
                    size: 20, color: Theme.of(context).primaryColor),
              ),
              FlatButton(
                onPressed: () {},
                child: FaIcon(FontAwesomeIcons.instagramSquare,
                    size: 20, color: Theme.of(context).primaryColor),
              ),
              FlatButton(
                onPressed: () {},
                child: FaIcon(FontAwesomeIcons.linkedinIn,
                    size: 20, color: Theme.of(context).primaryColor),
              ),
            ]),
            SizedBox(height: 20),
          ]),
          Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Company',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 20,
            ),
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
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Support',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {},
              textColor: Theme.of(context).primaryColor,
              child: Text('highfives.in@gmail.com'),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ],
      ),
    );
  }
}
