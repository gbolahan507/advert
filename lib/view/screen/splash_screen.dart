import 'package:flutter/material.dart';
import 'package:jiji_clone/core/view_models/startup_vm.dart';
import 'package:jiji_clone/view/widgets/export.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  Widget build(BuildContext context) {
    return BaseView<StartUpViewModel>(
      onModelReady: (StartUpViewModel model) => model.isLoggedIn(),
      builder: (_, StartUpViewModel model, __) => Scaffold(
          body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Image.asset('images/redlogo.png',
                  height: screenWidthFraction(context, dividedBy: 3))),
          // verticalSpaceMedium,
          verticalSpaceSmall,
          Text(
            'Q8UC',
            style:
                GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      )
          
          ),
    );
  }
}
