import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final _mensajesStreamController = StreamController<String>.broadcast();
  PreferenciasUsuario _prefs = new PreferenciasUsuario();

  Stream<String> get mensajes => _mensajesStreamController.stream;

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    print('onBackgroundMessage');

    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
      print(data);
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
      print(notification);
    }
  }

  initNotifications() {
   // _firebaseMessaging.requestNotificationPermissions();
   _firebaseMessaging.requestPermission();

    _firebaseMessaging.getToken().then((token) {
      print('===== FCM Token =====');
      print(token);
      print(_prefs.token);
      _prefs.token = token!;
    });

    // _firebaseMessaging.configure(
    //     onBackgroundMessage: Platform.isIOS
    //         ? null
    //         : PushNotificationProvider.onBackgroundMessage,
    //     onMessage: onMessage,
    //     onLaunch: onLaunch,
    //     onResume: onResume);
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('onMessage');
    print(message);
    String argumento = 'no-data';
    if (Platform.isAndroid) {
      String tempTitle = message['notification']['title'];
      argumento = message['notification']['body'];
      print('$tempTitle $argumento');
    } else {
      argumento = message['body'] ?? 'no-data';
    }

    _mensajesStreamController.sink.add(argumento);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print('onLaunch');
    print(message);
    String argumento = 'no-data';
    if (Platform.isAndroid) {
      String tempTitle = message['notification']['title'];
      argumento = message['notification']['body'];
      print('$tempTitle $argumento');
    } else {
      argumento = message['body'] ?? 'no-data';
    }
    _mensajesStreamController.sink.add(argumento);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print('onResume');
    String argumento = 'no-data';
    if (Platform.isAndroid) {
      String tempTitle = message['notification']['title'];
      argumento = message['notification']['body'];
      print('$tempTitle $argumento');
    } else {
      argumento = message['body'] ?? 'no-data';
    }
    _mensajesStreamController.sink.add(argumento);
  }

  dispose() {
    _mensajesStreamController.close();
  }
}

