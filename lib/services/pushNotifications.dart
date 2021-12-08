import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//SHA1: D3:9B:9F:FE:1E:33:9B:D4:37:83:B7:21:DB:A6:E3:E4:D2:5C:FA:BD
//SHA-256: 60:63:1D:60:4A:95:27:8D:81:C6:23:9B:D3:5C:D3:51:75:58:0C:6E:03:51:2E:73:0D:E0:D3:0C:21:D0:CF:72

class PushNotificationProvider {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _mensajesStreamController =
      new StreamController.broadcast();

  static Stream<String> get messagesStream => _mensajesStreamController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    final temp = message.notification?.title;
    if (temp != null) {
      _mensajesStreamController
          .add('${message.notification?.title}|${message.notification?.body}');
    } else {
      _mensajesStreamController
          .add('Notificación|Tienes una nueva notificación');
    }
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    final temp = message.notification?.title;
    if (temp != null) {
      _mensajesStreamController
          .add('${message.notification?.title}|${message.notification?.body}');
    } else {
      _mensajesStreamController
          .add('Notificación|Tienes una nueva notificación');
    }
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    final temp = message.notification?.title;
    if (temp != null) {
      _mensajesStreamController
          .add('${message.notification?.title}|${message.notification?.body}');
    } else {
      _mensajesStreamController
          .add('Notificación|Tienes una nueva notificación');
    }
  }

  static Future initializeApp() async {
    //Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreams() {
    _mensajesStreamController.close();
  }

  // final _mensajesStreamController = StreamController<String>.broadcast();
  // PreferenciasUsuario _prefs = new PreferenciasUsuario();

  // Stream<String> get mensajes => _mensajesStreamController.stream;

  // static Future<dynamic> onBackgroundMessage(
  //     Map<String, dynamic> message) async {
  //   print('onBackgroundMessage');

  //   if (message.containsKey('data')) {
  //     // Handle data message
  //     final dynamic data = message['data'];
  //     print(data);
  //   }

  //   if (message.containsKey('notification')) {
  //     // Handle notification message
  //     final dynamic notification = message['notification'];
  //     print(notification);
  //   }
  // }

  // initNotifications() {
  //   // _firebaseMessaging.requestNotificationPermissions();
  //   _firebaseMessaging.requestPermission();

  //   _firebaseMessaging.getToken().then((token) {
  //     print('===== FCM Token =====');
  //     print(token);
  //     print(_prefs.token);
  //     _prefs.token = token!;
  //   });

  //   // _firebaseMessaging.configure(
  //   //     onBackgroundMessage: Platform.isIOS
  //   //         ? null
  //   //         : PushNotificationProvider.onBackgroundMessage,
  //   //     onMessage: onMessage,
  //   //     onLaunch: onLaunch,
  //   //     onResume: onResume);
  // }

  // Future<dynamic> onMessage(Map<String, dynamic> message) async {
  //   print('onMessage');
  //   print(message);
  //   String argumento = 'no-data';
  //   if (Platform.isAndroid) {
  //     String tempTitle = message['notification']['title'];
  //     argumento = message['notification']['body'];
  //     print('$tempTitle $argumento');
  //   } else {
  //     argumento = message['body'] ?? 'no-data';
  //   }

  //   _mensajesStreamController.sink.add(argumento);
  // }

  // Future<dynamic> onLaunch(Map<String, dynamic> message) async {
  //   print('onLaunch');
  //   print(message);
  //   String argumento = 'no-data';
  //   if (Platform.isAndroid) {
  //     String tempTitle = message['notification']['title'];
  //     argumento = message['notification']['body'];
  //     print('$tempTitle $argumento');
  //   } else {
  //     argumento = message['body'] ?? 'no-data';
  //   }
  //   _mensajesStreamController.sink.add(argumento);
  // }

  // Future<dynamic> onResume(Map<String, dynamic> message) async {
  //   print('onResume');
  //   String argumento = 'no-data';
  //   if (Platform.isAndroid) {
  //     String tempTitle = message['notification']['title'];
  //     argumento = message['notification']['body'];
  //     print('$tempTitle $argumento');
  //   } else {
  //     argumento = message['body'] ?? 'no-data';
  //   }
  //   _mensajesStreamController.sink.add(argumento);
  // }

  // dispose() {
  //   _mensajesStreamController.close();
  // }
}
