import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/drawerItem.dart';

class DrawerItems {
  static const home =
      DrawerItem(title: 'Dashboard', icon: FontAwesomeIcons.home);
  static const agenda =
      DrawerItem(title: 'Agenda', icon: FontAwesomeIcons.calendar);
  static const eventos =
      DrawerItem(title: 'Eventos', icon: FontAwesomeIcons.birthdayCake);
  static const equipos =
      DrawerItem(title: 'Equipos', icon: FontAwesomeIcons.cameraRetro);
  static const profile =
      DrawerItem(title: 'Perfil', icon: FontAwesomeIcons.userAlt);
  static const logout =
      DrawerItem(title: 'Cerrar Sesión', icon: FontAwesomeIcons.signOutAlt);
  static final List<DrawerItem> all = [
    home,
    agenda,
    eventos,
    equipos,
    profile,
    logout
  ];
}


