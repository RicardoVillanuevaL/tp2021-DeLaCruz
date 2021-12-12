import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/models/notificacionesModel.dart';
import 'package:tp_2021_app/pages/administrador/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/styles.dart';
import 'package:tp_2021_app/services/eventServices.dart';

class VerNotificacionesPage extends StatelessWidget {
  final VoidCallback openDrawer;
  VerNotificacionesPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Notificaciones', style: titleAppBar),
          ),
          leading: DrawerMenuWidget(
              onClicked: openDrawer, icon: FontAwesomeIcons.calendar)),
      body: VerNotificacionesBody(),
    );
  }
}

class VerNotificacionesBody extends StatefulWidget {
  const VerNotificacionesBody({Key? key}) : super(key: key);

  @override
  _VerNotificacionesBodyState createState() => _VerNotificacionesBodyState();
}

class _VerNotificacionesBodyState extends State<VerNotificacionesBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(top: 28,left: 12,right: 12),
      child: FutureBuilder(
        future: eventServices.getAllNotificaciones(6),
        builder: (BuildContext context,
            AsyncSnapshot<List<NotificacionModel>> snapshot) {
          if (snapshot.hasData) {
            final temp = snapshot.data;
            if (temp!.length != 0) {
              return ListView.builder(
                itemCount: temp.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: colorBlueDark1),
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsetsDirectional.all(8),
                      child: ListTile(
                        leading: Icon(
                          Icons.notifications,
                          size: 28,
                          color: Colors.green,
                        ),
                        title: Text(temp[index].titulo ?? 'No carga el titulo',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontsGothic,
                                        fontSize: 16),),
                        subtitle: Text(
                            temp[index].cuerpo ?? 'No carga la notificación',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontsGothic,
                                        fontSize: 14),),
                      ));
                },
              );
            } else {
              return Center(
                child: Text(
                  'No tiene Notificaciones',
                  style: titleLoginStyle,
                ),
              );
            }
          } else {
            return Positioned.fill(
                child: Center(child: CupertinoActivityIndicator()));
          }
        },
      ),
    );
  }
}
