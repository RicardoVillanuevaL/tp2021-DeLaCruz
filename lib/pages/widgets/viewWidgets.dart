import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/styles.dart';

class ItemDetailProyecto extends StatelessWidget {
  const ItemDetailProyecto({
    Key? key,
    required this.text,
    required this.title,
    required this.icon
  }) : super(key: key);

  final String text;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FaIcon(icon, color: colorBlueDark2,size: 32,),
      ) ,
      title: Text(title, style: TextStyle(fontFamily: fontsGothic,fontSize: 20),),subtitle: Text(text,style: TextStyle(fontSize: 16,color: colorBlueDark1),),);
  }
}