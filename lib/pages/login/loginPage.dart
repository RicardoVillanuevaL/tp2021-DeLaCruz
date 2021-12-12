import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/pages/widgets/actionWidgets.dart';
import 'package:tp_2021_app/resources/styles.dart';
import 'package:tp_2021_app/services/loginServices.dart';
import 'package:tp_2021_app/core/notifications_utils.dart' as dialog;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final prefs = PreferenciasUsuario();
  var usuario = TextEditingController();
  var pass = TextEditingController();
  bool visiblePass = true;
  bool _isFetching = false;
  @override
  void initState() {
    super.initState();
    usuario = TextEditingController(text: prefs.correo);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 100),
                  Text(
                    'Inicie Sesión!',
                    style: titleLoginStyle,
                  ),
                  SizedBox(height: 100),
                  Container(
                    width: size.width - 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextFormField(
                        controller: usuario,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'Usuario',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            icon: FaIcon(FontAwesomeIcons.user,
                                color: Colors.white))),
                  ),
                  Container(
                    width: size.width - 50,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Row(
                      children: [
                        Container(
                          width: size.width - 100,
                          child: TextFormField(
                              obscureText: visiblePass,
                              controller: pass,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  hintText: 'Contraseña',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  icon: FaIcon(FontAwesomeIcons.lock,
                                      color: Colors.white))),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              visiblePass = !visiblePass;
                            });
                          },
                          child: Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: FaIcon(
                                visiblePass
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () async {
                        if (usuario.text.isNotEmpty && pass.text.isNotEmpty) {
                          if (_isFetching) return;
                          setState(() {
                            _isFetching = true;
                          });
                          print(usuario.text + " " + pass.text);

                          final resp = await log.login(usuario.text, pass.text);
                          print(resp);

                          if (resp['ok']) {
                            setState(() {
                              _isFetching = false;
                            });

                            dialog.alertWaitDialog(
                                context,
                                'Bienvenido',
                                '${resp['mensaje']}',
                                'assets/connectionSuccess.png');
                            await Future.delayed(Duration(seconds: 3));
                            Navigator.pop(context);

                            //////////////////////////////////////////////////////////////////////////

                            navigationPage();

                            //////////////////////////////////////////////////////////////////////////
                          } else {
                            setState(() {
                              _isFetching = false;
                            });
                            dialog.alertaImagen(
                                context,
                                'Oh no!',
                                '${resp['mensaje']}',
                                'assets/connectionError.png');
                          }
                        } else {
                          dialog.alertaImagen(
                              context,
                              'Datos imcompletos',
                              'Por favor digite su correo y su contraseña.\nEn caso de no recordarlos o no saber si esta registrado, toqué en Ayuda.',
                              'assets/connectionError.png');
                        }
                      },
                      child: ButtonTransparent(text: 'Aceptar'))
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/logingif.gif'),
                  colorFilter:
                      ColorFilter.mode(Colors.white70, BlendMode.modulate),
                  fit: BoxFit.fitHeight),
            ),
          ),
          _isFetching
              ? Positioned.fill(
                  child: Container(
                  color: Colors.black45,
                  child: Center(
                    child: CupertinoActivityIndicator(
                      radius: 15,
                    ),
                  ),
                ))
              : Container()
        ],
      ),
    );
  }

  void navigationPage() {
    final prefs = PreferenciasUsuario();
    if (prefs.admin) {
      Navigator.pushNamed(context, 'homeAdmin');
    } else {
      Navigator.pushNamed(context, 'home');
    }
  }
}
