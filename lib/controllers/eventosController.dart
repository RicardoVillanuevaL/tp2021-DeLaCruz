import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventosProvider with ChangeNotifier, DiagnosticableTreeMixin {}

class Event {
  final String title;
  const Event(this.title);
  @override
  String toString() => title;
}

bool isSameDate(DateTime? x, DateTime? y) {
  if (x == null || y == null) {
    return false;
  } else {
    return x.year == y.year && x.month == y.month && x.day == y.day;
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final firstDay = DateTime.utc(2010, 10, 16);
final lastDay = DateTime.utc(2030, 3, 14);
