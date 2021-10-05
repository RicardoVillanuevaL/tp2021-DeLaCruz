import 'package:flutter/material.dart';
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
          color: Colors.transparent),
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
