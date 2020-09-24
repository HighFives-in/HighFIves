import 'package:flutter/material.dart';
import 'package:highfives_ui/screens/employer/dashboard/employerDashboard.dart';
import 'package:highfives_ui/screens/tnp/dashboard/tnpdashboard.dart';
import 'package:highfives_ui/screens/utils/loading.dart';

class Path {
  final String pathPattern;
  final Widget Function(BuildContext, String) builder;
  const Path(this.pathPattern, this.builder);

//we need to enter a regex here to match
  static List<Path> paths = [
    Path(r'^' + '/loading', (context, match) => Loading()),
    Path(r'tnp\/communications\/\d*_\d*', (context, match) => TnpView(match)),
    Path(r'\/tnp\/communications\/*', (context, match) => TnpView(match)),
    Path(r'\/tnp\/\d*_\d*', (context, match) => TnpView(match)),
    Path(r'\/tnp', (context, match) => TnpView(match)),
    Path(r'^' + '/loading', (context, match) => Loading()),
    Path(r'employer\/communications\/\d*_\d*',
        (context, match) => EmployerView(match)),
    Path(r'\/employer\/communications\/*',
        (context, match) => EmployerView(match)),
    Path(r'\/employer\/\d*_\d*', (context, match) => EmployerView(match)),
    Path(r'\/employer', (context, match) => EmployerView(match)),
  ];

  // //TODO WIRNG ONLY FOR TNP
  // Path(r'\/', (context, match) => TnpView(match)),

  //TODO WIRNG ONLY FOR TNP
  // Path(r'\/', (context, match) => EmployerView(match)),

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    //dynamic routes
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pathPattern);
      if (regExpPattern.hasMatch(settings.name)) {
        // final firstMatch = regExpPattern.firstMatch(settings.name);
        // final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, settings.name),
          settings: settings,
        );
      }
    }
  }

  // // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
  // //TODO MAY BE LOG ?
  // print('route not found' + settings.name);
  // return null;

  static final Map<String, WidgetBuilder> customRoutes = {
    'tnp': (context) => TnpView(TnpView.tnpMainRoute),
  };
}

/*
PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, animationTime, child) {
            return ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child,
            );
          },
          pageBuilder: (context, animation, animationTime) {
            return path.builder(context, settings.name);
          },
        );    
 */
