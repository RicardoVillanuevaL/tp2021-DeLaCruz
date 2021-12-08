import 'package:flutter/material.dart';
import 'package:tp_2021_app/pages/login/loginPage.dart';
import 'package:tp_2021_app/pages/login/splashPage.dart';
import 'package:tp_2021_app/pages/trabajador/home/homeMainPage.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/services/pushNotifications.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    PushNotificationProvider.messagesStream.listen((message) {
      print('MyApp: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColorDark: colorBlueDark2, primaryColor: colorBlueDark2),
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
