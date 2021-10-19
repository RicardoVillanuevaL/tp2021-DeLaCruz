import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/styles.dart';

class PageViewItem extends StatelessWidget {
  final String title, body;
  final Widget page;
  const PageViewItem(this.title, this.body, this.page);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, textAlign: TextAlign.center, style: titleLoginStyle),
        SizedBox(height: 20),
        Text(body,
            textAlign: TextAlign.center,
            style: TextStyle(color: colorBlueDark1, fontSize: 16)),
        SizedBox(height: 20),
        page,
      ],
    ));
  }
}

class ButtonTransparent extends StatefulWidget {
  const ButtonTransparent({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  _ButtonTransparentState createState() => _ButtonTransparentState();
}

class _ButtonTransparentState extends State<ButtonTransparent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        widget.text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white12),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    );
  }
}

class IndicatorPage extends StatefulWidget {
  final bool activado;
  const IndicatorPage(this.activado);

  @override
  _IndicatorPageState createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: widget.activado ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}

class ItemTitleSeparated extends StatefulWidget {
  final String title;
  final bool openSeccion;
  const ItemTitleSeparated(
      {Key? key, required this.title, required this.openSeccion})
      : super(key: key);

  @override
  State<ItemTitleSeparated> createState() => _ItemTitleSeparatedState();
}

class _ItemTitleSeparatedState extends State<ItemTitleSeparated> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: fontsGothic,
                      fontSize: 18)),
              FaIcon(
                widget.openSeccion
                    ? FontAwesomeIcons.angleUp
                    : FontAwesomeIcons.angleDown,
                color: Colors.white,
              ),
            ],
          ),
          Divider(
            color: Colors.white,
            height: 2,
          )
        ],
      ),
    );
  }
}

class TitleSeccionEvento extends StatelessWidget {
  final String title;
  final bool selection;
  const TitleSeccionEvento(
      {Key? key, required this.title, required this.selection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: selection ? colorBlueDark1 : Colors.white,
        radius: 25,
        child: Text(title[0].toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selection ? Colors.white : colorBlueDark1)),
      ),
      label: Text(title,
          style: TextStyle(
              color: selection ? colorBlueDark1 : Colors.white,
              fontFamily: fontsGothic,
              fontSize: 16)),
      backgroundColor: selection ? Colors.white : colorBlueDark1,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
    );
  }
}

class TitleDivider extends StatelessWidget {
  final String title;
  const TitleDivider({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: Colors.white, fontFamily: fontsGothic, fontSize: 18)),
        Divider(color: Colors.white, height: 2)
      ],
    );
  }
}
