import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';

//SHA1: D3:9B:9F:FE:1E:33:9B:D4:37:83:B7:21:DB:A6:E3:E4:D2:5C:FA:BD
//SHA-256: 60:63:1D:60:4A:95:27:8D:81:C6:23:9B:D3:5C:D3:51:75:58:0C:6E:03:51:2E:73:0D:E0:D3:0C:21:D0:CF:72


class PushNotificationProvider {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  PreferenciasUsuario prefs = new PreferenciasUsuario();
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

  initializeApp() async {
    //Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    prefs.cellToken = token!;
    print(token);
    print('asdasdasd ${prefs.cellToken}');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreams() {
    _mensajesStreamController.close();
  }
}
