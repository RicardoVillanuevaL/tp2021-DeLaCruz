import 'package:flutter/material.dart';
import 'package:tp_2021_app/pages/login/profilePage.dart';
import 'package:tp_2021_app/pages/trabajador/equipos/verificarEntregaPage.dart';
import 'package:tp_2021_app/pages/trabajador/eventos/eventosPage.dart';
import 'package:tp_2021_app/pages/trabajador/eventos/verAgendaPage.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/drawerItem.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/drawerWidget.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/listOptionsDrawer.dart';
import 'package:tp_2021_app/pages/trabajador/home/homePage.dart';
import 'package:tp_2021_app/resources/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;
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
              case DrawerItems.logout:
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

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.agenda:
        return VerAgendaPage(openDrawer: openDrawer);
      case DrawerItems.eventos:
        return EventosPage(openDrawer: openDrawer);
      case DrawerItems.equipos:
        return VerificarEntregaEPage(openDrawer: openDrawer);
      case DrawerItems.profile:
        return ProfilePage(openDrawer: openDrawer);
      case DrawerItems.home:
      default:
        return HomeWidget(openDrawer: openDrawer);
    }
  }
}
