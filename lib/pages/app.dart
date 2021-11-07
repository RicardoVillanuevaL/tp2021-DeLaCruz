import 'package:flutter/material.dart';
import 'package:tp_2021_app/pages/home/homeMainPage.dart';
import 'package:tp_2021_app/pages/login/loginPage.dart';
import 'package:tp_2021_app/pages/login/splashPage.dart';
import 'package:tp_2021_app/resources/colors.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColorDark: colorBlueDark2,primaryColor: colorBlueDark2),
      title: 'App De La Cruz',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'login': (_) => LoginPage(),
        'splash': (_) => SplashPage(),
        'home': (_) => HomePage(),
        // 'agenda': (_) => VerAgendaPage(),
        // 'incidencia': (_) => RegistrarIncidenciasPage(),
        // 'llegada': (_) => VerificarLlegadaPage(),
        // 'entregaE': (_) => VerificarEntregaEPage()
      },
    );
  }
}
