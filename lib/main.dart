import 'package:flutter/material.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/pages/app.dart';
import 'package:tp_2021_app/services/pushNotifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  await PushNotificationProvider().initializeApp();
  runApp(MyApp());
}
