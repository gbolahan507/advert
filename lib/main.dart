import 'package:flutter/material.dart';
import 'package:jiji_clone/view/screen/splash_screen.dart';
import 'package:jiji_clone/core/utils/dialog_manager.dart';
import 'package:jiji_clone/core/utils/dialog_service.dart';
import 'package:jiji_clone/locator.dart';
import 'package:jiji_clone/core/routes/navigator.dart';
import 'package:jiji_clone/core/routes/router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'core/storage/local_storage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCache.init(); //Initialize Hive for Flutter
  setupLocator();
  runApp(const MyApp());
}

ValueNotifier<int> cartCount;

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: allProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme:
                  GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
              primaryColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: SplashScreen(),
          builder: (BuildContext context, Widget child) => Navigator(
              key: locator<DialogService>().dialogNavigationKey,
              onGenerateRoute: (RouteSettings settings) =>
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          DialogManager(child: child))),
          navigatorKey: locator<NavigationService>().navigationKey,
          onGenerateRoute: generateRoute,
        ));
  }
}
