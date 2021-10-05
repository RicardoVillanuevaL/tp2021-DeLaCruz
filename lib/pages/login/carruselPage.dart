import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_2021_app/pages/login/loginPage.dart';
import 'package:tp_2021_app/pages/widgets/actionWidgets.dart';
import 'package:tp_2021_app/resources/styles.dart';

class CarruselPage extends StatefulWidget {
  CarruselPage({Key? key}) : super(key: key);

  @override
  _CarruselPageState createState() => _CarruselPageState();
}

class _CarruselPageState extends State<CarruselPage> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;
  var listTitle = [
    'Verificar llegada',
    'Listar Agenda',
    'Reporte de Incidencias'
  ];
  var listbody = [
    'Los trabajadores podrán marcar su llegada al evento',
    'Lista de todos los eventos asignados',
    'Un rapido registro de incidencias que ocurren en el evento'
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        children: [
          Image.asset(
            'assets/fotografia-de-bodas-03.jpg',
            fit: BoxFit.fitHeight,
          ),
          Image.asset(
            'assets/fotografia-profesional.jpg',
            fit: BoxFit.fitHeight,
          ),
          Image.asset(
            'assets/matrimonio.jpg',
            fit: BoxFit.fitHeight,
          ),
        ],
        onPageChanged: (val) {
          setState(() {
            page = val;
          });
        },
        controller: controller,
      ),
      Stack(
        children: [
          Positioned(
              top: 20,
              right: 10,
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) => LoginPage()),
                      (route) => false);
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('Skip',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    Icon(Icons.chevron_right, color: Colors.white, size: 35)
                  ]),
                ),
              )),
          Positioned(
            top: 80,
            left: 40,
            right: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(listTitle[page], style: titleLoginStyle),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    listbody[page],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      Positioned(
          bottom: 50,
          left: 40,
          right: 40,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                splashColor: Colors.white,
                onTap: () {
                  if (page == 2) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => LoginPage()),
                        (route) => false);
                  } else {
                    setState(() {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    });
                  }
                },
                child: ButtonTransparent(
                    text: page == 2 ? 'Comencemos' : 'Siguiente'),
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                IndicatorPage(page == 0),
                IndicatorPage(page == 1),
                IndicatorPage(page == 2)
              ])
            ],
          )),
    ]));
  }
}
