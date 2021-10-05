import 'package:flutter/material.dart';
import 'package:tp_2021_app/pages/login/splashPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App De La Cruz',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
