import 'package:flutter/material.dart';

class EventoDetailPage extends StatefulWidget {
  final int idEvento;
  const EventoDetailPage({Key? key, required this.idEvento}) : super(key: key);

  @override
  _EventoDetailPageState createState() => _EventoDetailPageState();
}

class _EventoDetailPageState extends State<EventoDetailPage> {
  @override
  Widget build(BuildContext context) {
    print(this.widget.idEvento);
    return Scaffold();
  }
}
