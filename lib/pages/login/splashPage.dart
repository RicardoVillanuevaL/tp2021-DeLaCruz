import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/pages/login/carruselPage.dart';
import 'package:tp_2021_app/pages/login/loginPage.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    validateRoute();
    super.initState();
  }

  validateRoute() async {
    await Future.delayed(Duration(milliseconds: 1200), () {
      if (prefs.carrusel) {
        if (prefs.token.isNotEmpty) {
        //   //GO TO HOME - ESTA LOGUEADO Y YA VIO EL CARRUSEL
        // } else {
        //   //GO TO LOGIN
          Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
                builder: (BuildContext context) => LoginPage()),
            (route) => false);
        }
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
                builder: (BuildContext context) => CarruselPage()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CupertinoActivityIndicator()));
  }
}
