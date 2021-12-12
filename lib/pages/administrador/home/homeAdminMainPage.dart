import 'package:flutter/material.dart';
import 'package:tp_2021_app/pages/administrador/calendario/VerCalendarioEventosPage.dart';
import 'package:tp_2021_app/pages/administrador/home/drawer/drawerItem.dart';
import 'package:tp_2021_app/pages/administrador/home/homeAdminPage.dart';
import 'package:tp_2021_app/pages/administrador/incidencias/verIncidenciasPage.dart';
import 'package:tp_2021_app/pages/administrador/notificaciones/verNotificacionesPage.dart';
import 'package:tp_2021_app/pages/administrador/proyectos/verProyectosPage.dart';

import 'package:tp_2021_app/pages/administrador/home/drawer/drawerWidget.dart';
import 'package:tp_2021_app/pages/administrador/home/drawer/listOptionsDrawer.dart';


import 'package:tp_2021_app/resources/colors.dart';

class HomePageAdmin extends StatefulWidget {
  HomePageAdmin({Key? key}) : super(key: key);

  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItemsAdmin.home;
  bool isDragging = false;
  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlueDark2,
      body: Stack(
        children: [buildDrawer(), builPage()],
      ),
    );
  }

  Widget buildDrawer() => SafeArea(
          child: Container(
        width: xOffset,
        child: DrawerWidget(
          onSelectedItem: (item) {
            switch (item) {
              case DrawerItemsAdmin.logout:
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Cerrar Sesion')));
                return;
              default:
                setState(() => this.item = item);
                closeDrawer();
            }
          },
        ),
      ));

  Widget builPage() => WillPopScope(
        onWillPop: () async {
          if (isDrawerOpen) {
            closeDrawer();
            return false;
          } else {
            return true;
          }
        },
        child: GestureDetector(
          onTap: closeDrawer,
          onHorizontalDragStart: (details) => isDragging = true,
          onHorizontalDragUpdate: (details) {
            if (!isDragging) return;
            const delta = 1;
            if (details.delta.dx > delta) {
              openDrawer();
            } else if (details.delta.dx < -delta) {
              closeDrawer();
            }
            isDragging = false;
          },
          child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor),
              child: AbsorbPointer(
                absorbing: isDrawerOpen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                  child: Container(
                    color: isDrawerOpen ? Colors.white12 : colorBlueDark2,
                    child: getDrawerPage(),
                  ),
                ),
              )),
        ),
      );
//ESTO ES LO CAMBIA DESPUES ALL IS SIMILAR
  Widget getDrawerPage() {
    switch (item) {
      case DrawerItemsAdmin.agenda:
        return VerCalendarioEventosPage(openDrawer: openDrawer);
      case DrawerItemsAdmin.eventos:
        return VerNotificacionesPage(openDrawer: openDrawer);
      case DrawerItemsAdmin.equipos:
        return VerIncidenciasPage(openDrawer: openDrawer);
      case DrawerItemsAdmin.profile:
        return VerProyectosPage(openDrawer: openDrawer);
      case DrawerItemsAdmin.home:
      default:
        return HomeAdminWidget(openDrawer: openDrawer);
    }
  }
}
