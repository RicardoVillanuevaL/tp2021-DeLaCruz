import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/controllers/eventosController.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/models/eventosAgendaModel.dart';
import 'package:tp_2021_app/pages/trabajador/eventos/eventoDetailPage.dart';
import 'package:tp_2021_app/pages/trabajador/home/drawer/drawerIconMenu.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/styles.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tp_2021_app/services/eventServices.dart';

class VerAgendaPage extends StatelessWidget {
  final VoidCallback openDrawer;
  VerAgendaPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Mi Agenda', style: titleAppBar),
          ),
          leading: DrawerMenuWidget(
              onClicked: openDrawer, icon: FontAwesomeIcons.calendar)),
      body: VerAgendaBody(),
    );
  }
}

class VerAgendaBody extends StatefulWidget {
  VerAgendaBody({Key? key}) : super(key: key);

  @override
  _VerAgendaBodyState createState() => _VerAgendaBodyState();
}

class _VerAgendaBodyState extends State<VerAgendaBody> {
  final prefs = PreferenciasUsuario();
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  late final ValueNotifier<List<Event>> _selectedEvents;
  List<EventosAgenda> eventos = [];
  List<DateTime> listaDias = [];

  @override
  void initState() {
    initializeDateFormatting();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    loadEvents();
    super.initState();
  }

  void loadEvents() async {
    eventos =
        await eventServices.getAllEventosAgenda(DateTime.now().toString(), prefs.id);
    eventos.forEach((e) {
      listaDias.add(DateTime.parse(e.fecha));
    });
    setState(() {
      print(listaDias.length);
    });
  }

  List<Event> _getEventsForDay(DateTime day) {
    var events = LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDate, hashCode: getHashCode)
      ..addAll(Map.fromIterable(listaDias,
          key: (item) => item,
          value: (item) {
            String texto = 'Evento';
            for (var i = 0; i < eventos.length; i++) {
              if (DateTime.parse(eventos[i].fecha) == item) {
                texto =
                    '${eventos[i].nombre}|${eventos[i].id}@${eventos[i].hora}';
              }
            }
            return [Event(texto)];
          }));
    return events[day] ?? [];
  }

  void _onDaySelected(DateTime selectDay, DateTime focusedDay) {
    if (!isSameDate(_selectedDay, selectDay)) {
      setState(() {
        _selectedDay = selectDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.grey, primaryColorDark: Colors.white)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            TableCalendar<Event>(
              focusedDay: _focusedDay,
              firstDay: firstDay,
              lastDay: lastDay,
              selectedDayPredicate: (date) => isSameDate(_selectedDay, date),
              daysOfWeekVisible: true,
              eventLoader: _getEventsForDay,
              onDaySelected: _onDaySelected,
              locale: 'es-ES',
              onPageChanged: (focusedDay) => _focusedDay = focusedDay,
              daysOfWeekStyle: DaysOfWeekStyle(
                  dowTextFormatter: (date, locale) {
                    return DateFormat.E(locale).format(date).toUpperCase();
                  },
                  weekdayStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  weekendStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleTextFormatter: (date, locale) {
                    return DateFormat.yMMMM(locale).format(date).toUpperCase();
                  },
                  leftChevronIcon:
                      FaIcon(FontAwesomeIcons.angleLeft, color: Colors.white),
                  rightChevronIcon:
                      FaIcon(FontAwesomeIcons.angleRight, color: Colors.white),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: fontsGothic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                  selectedTextStyle: TextStyle(
                      color: colorBlueDark2,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  markerDecoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  selectedDecoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle),
                  todayTextStyle: TextStyle(
                      color: colorBlueDark2,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  todayDecoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  weekendTextStyle:
                      TextStyle(color: Colors.white, fontSize: 16),
                  defaultTextStyle:
                      TextStyle(color: Colors.white, fontSize: 16)),
            ),
            SizedBox(height: 12),
            Expanded(
                child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (BuildContext context, int index) {
                    String texto = value[index].toString();
                    int separador = texto.indexOf('|');
                    String evento = texto.substring(0, separador);
                    int separador2 = texto.indexOf('@');
                    int id =
                        int.parse(texto.substring(separador + 1, separador2));
                    String hora = texto.substring(separador2 + 1);
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        trailing: FaIcon(FontAwesomeIcons.arrowRight,
                            color: Colors.white),
                        leading: Container(
                            height: 12,
                            width: 12,
                            margin: const EdgeInsets.only(top: 8, left: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.greenAccent[700])),
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    EventoDetailPage(idEvento: id))),
                        subtitle: Text(hora,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        title: Text(
                          evento,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: fontsGothic,
                              fontSize: 20),
                        ),
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
