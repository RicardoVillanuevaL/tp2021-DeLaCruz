import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tp_2021_app/pages/administrador/home/homeAdminMainPage.dart';
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
  final GlobalKey<NavigatorState> globalKey = new GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    PushNotificationProvider.messagesStream.listen((message) {
      final list = message.split('|');
      final title = list[0];
      final mensaje = list[1];
      
      Flushbar(
        title: title,
        message: mensaje,
        icon: Icon(
          Icons.notifications,
          size: 28,
          color: Colors.green,
        ),
        leftBarIndicatorColor: Colors.green,
        duration: Duration(seconds: 3),
      )..show(globalKey.currentContext!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalKey,
      theme: ThemeData(
          primaryColorDark: colorBlueDark2, primaryColor: colorBlueDark2),
      title: 'App De La Cruz',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'login': (_) => LoginPage(),
        'splash': (_) => SplashPage(),
        'home': (_) => HomePage(),
        'homeAdmin': (_) => HomePageAdmin(),
        // 'agenda': (_) => VerAgendaPage(),
        // 'incidencia': (_) => RegistrarIncidenciasPage(),
        // 'llegada': (_) => VerificarLlegadaPage(),
        // 'entregaE': (_) => VerificarEntregaEPage()
      },
    );
  }
}
