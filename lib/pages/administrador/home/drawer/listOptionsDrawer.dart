import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/pages/administrador/home/drawer/drawerItem.dart';

class DrawerItemsAdmin {
  static const home =
      DrawerItem(title: 'Dashboard', icon: FontAwesomeIcons.home);
  static const agenda =
      DrawerItem(title: 'Calendario', icon: FontAwesomeIcons.calendar);
  static const eventos =
      DrawerItem(title: 'Historial', icon: FontAwesomeIcons.bell);
  static const equipos =
      DrawerItem(title: 'Reportes', icon: FontAwesomeIcons.file);
  static const profile =
      DrawerItem(title: 'Ver Proyectos', icon: FontAwesomeIcons.list);
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
