import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiji_clone/core/routes/routes.dart';
import 'package:jiji_clone/view/screen/homepage.dart';
import 'package:jiji_clone/view/screen/profile_screen.dart';
import 'package:jiji_clone/view/screen/signin_page.dart';
import 'package:jiji_clone/view/screen/signup_page.dart';
import 'package:jiji_clone/view/screen/splash_screen.dart';





Route<dynamic> generateRoute(RouteSettings settings) {


  switch (settings.name) {
    case SplashView:
      return _getPageRoute(
        routeName: settings.name,
        view:  SplashScreen(),
      );
    case LoginView:
      return _getPageRoute(
        routeName: settings.name,
        view:  LoginScreen(),
      );

    case SignupView:
      return _getPageRoute(
        routeName: settings.name,
        view:  SignupScreen(),
        args: settings.arguments,
      );
      
     case ProfileView:
      return _getPageRoute(
        routeName: settings.name,
        view:  ProfileScreen(),
        args: settings.arguments,
      );

           case HomeScreenView:
      return _getPageRoute(
        routeName: settings.name,
        view:  HomeSccreen(),
        args: settings.arguments,
      );


    default:
      return CupertinoPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute<dynamic> _getPageRoute({String routeName, Widget view, Object args}) {
  return CupertinoPageRoute<dynamic>(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => view);
}


void routeTo(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.push<void>(
      context,
      CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}

void routeToReplace(BuildContext context, Widget view) {
  Navigator.pushAndRemoveUntil<void>(
      context,
      CupertinoPageRoute<dynamic>(builder: (BuildContext context) => view),
      (Route<void> route) => false);
}
