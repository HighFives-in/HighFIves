import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/constants/const/theme.dart';
import 'package:highfives_ui/constants/const/token.dart';
import 'package:highfives_ui/locator.dart';
import 'package:highfives_ui/logging/logger.dart';
import 'package:highfives_ui/resources/Identity/main.dart';
import 'package:highfives_ui/screens/employer/dashboard/employerDashboard.dart';
import 'package:highfives_ui/screens/home.dart';
import 'package:highfives_ui/screens/tnp/dashboard/tnpdashboard.dart';
import 'package:highfives_ui/screens/utils/loading.dart';
import 'package:highfives_ui/screens/utils/navigationService.dart';
import 'package:highfives_ui/utils/route.dart';
import 'package:highfives_ui/utils/themeChanger.dart';
import 'package:highfives_ui/utils/toast.dart';
import 'package:highfives_ui/utils/unknownPage.dart';
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
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'HighFives',
      theme: _theme.getTheme(),
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: '/',
      onGenerateRoute: Path.onGenerateRoute,
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => UnknownPage(
          name: settings.name,
        ),
      ),
    );
  }
}

class AppStart extends StatelessWidget {
  final _identityResource = IdentityResource(findPlatform());
  final log = getLogger('AppStart');
  @override
  Widget build(BuildContext context) {
    log.i('BUILDING APP START');
    return FutureBuilder(
      future: _findtoken(TokenType.AccessToken),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          //TODO LOG ERROR
          log.e(snapshot.hasError);
          basicErrorFlutterToast(
              "Something went wrong on main page + ${snapshot.error}");
        }
        if (!snapshot.hasData) return Loading();
        if (snapshot.data != null && snapshot.data != "") {
          //TODO
          // return TnpView(TnpView.tnpMainRoute);
          var tokenData = snapshot.data;
          var role = tokenData["role"];
          switch (role) {
            case TNP:
              return TnpView('/');
              break;
            case EMPLOYER:
              return EmployerView('/');
              break;
            case STUDENT:
              return null;
              break;
          }
        } else {
          return HomeUi();
        }
      },
    );
  }

  Future<dynamic> _findtoken(dynamic tokenType) async {
    return await _identityResource.findtoken(tokenType);
  }
}
