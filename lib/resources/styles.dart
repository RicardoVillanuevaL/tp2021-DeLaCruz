import 'package:flutter/material.dart';
import 'package:tp_2021_app/resources/colors.dart';

final titleLoginStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22);

final gradientPrimary = LinearGradient(
    colors: [colorBlueDark2, colorBlue],
    end: Alignment.bottomCenter,
    begin: Alignment.topCenter);

final String fontsGothic = 'Gothic-Bold';

final messageNotExistList = TextStyle(color: Colors.white, fontSize: 16);
final titleAppBar = TextStyle(fontFamily: fontsGothic, fontSize: 24);
