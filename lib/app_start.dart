import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:highfives_ui/constants/const/theme.dart';
import 'package:highfives_ui/constants/const/token.dart';
import 'package:highfives_ui/resources/Identity/main.dart';
import 'package:highfives_ui/screens/employer/dashboard/employerDashboard.dart';
import 'package:highfives_ui/screens/home_page/main.dart';
import 'package:highfives_ui/screens/login/login.dart';
import 'package:highfives_ui/screens/tnp/dashboard/tnpdashboard.dart';
import 'package:highfives_ui/utils/themeChanger.dart';
import 'package:provider/provider.dart';
import 'package:highfives_ui/utils/platform.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(LIGHTTHEME),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  final _identityResource = IdentityResource(findPlatform());

  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'HighFives',
      theme: _theme.getTheme(),
      home: FutureBuilder(
        future: _findtoken(TokenType.AccessToken),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Fluttertoast.showToast(
                msg: "Something Went wrong in Login",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data != null && snapshot.data) {
            //TODO
            return EmployerView();
          } else {
            return LoginUI();
          }
        },
      ),
    );
  }

  Future<dynamic> _findtoken(dynamic tokenType) async {
    return await _identityResource.findtoken(tokenType);
  }
}
