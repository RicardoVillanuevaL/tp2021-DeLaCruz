import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/styles.dart';

class DialogInfo extends StatelessWidget {
  final String title, descriptions;
  final IconData icon;
  const DialogInfo(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 45),
            margin: const EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 10),
                      blurRadius: 10)
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: TextStyle(fontSize: 20, fontFamily: fontsGothic)),
                SizedBox(height: 16),
                Text(descriptions,
                    style: TextStyle(fontSize: 16, fontFamily: fontsGothic)),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    child: Text('Aceptar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: colorBlueDark2,
              radius: 45,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                  child: FaIcon(
                    icon,
                    size: 40,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
