import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/core/navigation.dart';
import 'package:tp_2021_app/pages/trabajador/home/homeMainPage.dart';
import 'package:tp_2021_app/pages/widgets/actionWidgets.dart';
import 'package:tp_2021_app/pages/widgets/inputsWidgets.dart';
import 'package:tp_2021_app/resources/styles.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usuario = TextEditingController();
  var pass = TextEditingController();
  bool visiblePass = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                        icon: FaIcon(FontAwesomeIcons.user,
                            color: Colors.white))),
              ),
              Container(
                width: size.width - 50,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Row(
                  children: [
                    Container(
                      width: size.width - 100,
                      child: TextFormField(
                          obscureText: visiblePass,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: 'Contraseña',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () => nav.navigationRemove(context, HomePage()),
                  child: ButtonTransparent(text: 'Aceptar'))
            ],
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/logingif.gif'),
              colorFilter: ColorFilter.mode(Colors.white70, BlendMode.modulate),
              fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
