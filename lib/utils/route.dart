import 'package:flutter/material.dart';
import 'package:highfives_ui/app_start.dart';
import 'package:highfives_ui/screens/employer/dashboard/employerDashboard.dart';
import 'package:highfives_ui/screens/tnp/dashboard/tnpdashboard.dart';
import 'package:highfives_ui/screens/utils/loading.dart';

class Path {
  final String pathPattern;
  final Widget Function(BuildContext, String) builder;
  const Path(this.pathPattern, this.builder);

//we need to enter a regex here to match
// IMPORTANT NOTE Path(r'\/', (context, match) => AppStart()),
// should be at the end of list in paths because this is the main path and will match every regex
  static List<Path> paths = [
    Path(r'^tnp\/communications\/\d*_\d*', (context, match) => TnpView(match)),
    Path(r'^\/tnp\/communications\/*', (context, match) => TnpView(match)),
    Path(r'\/tnp\/communications', (context, match) => TnpView(match)),
    Path(r'^\/tnp\/\d*_\d*', (context, match) => TnpView(match)),
    Path(r'^\/tnp', (context, match) => TnpView(match)),
    Path(r'^' + '/loading', (context, match) => Loading()),
    Path(r'^employer\/Communications\/\d*_\d*',
        (context, match) => EmployerView(match)),
    Path(r'^\/employer\/Communications',
        (context, match) => EmployerView(match)),
    Path(r'^\/employer\/Communications\/*',
        (context, match) => EmployerView(match)),
    Path(r'^\/employer\/\d*_\d*', (context, match) => EmployerView(match)),
    Path(r'^\/employer', (context, match) => EmployerView(match)),
    Path(r'\/', (context, match) => AppStart()),
  ];

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
            transitionsBuilder: (context, animation, animationTime, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInToLinear);
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: const Offset(0, 0),
                ).animate(animation),
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return path.builder(context, settings.name);
            },
            settings: settings);

       

        
 */
