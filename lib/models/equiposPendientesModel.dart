import 'dart:convert';

List<EquiposPendiente> equiposPendienteFromJson(String str) =>
    List<EquiposPendiente>.from(
        json.decode(str).map((x) => EquiposPendiente.fromJson(x)));

String equiposPendienteToJson(List<EquiposPendiente> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EquiposPendiente {
  EquiposPendiente({
    required this.nombre,
    required this.fecha,
    required this.equipo,
    required this.idProyecto,
    required this.idPedido,
  });

  String nombre;
  String fecha;
  int equipo;
  int idProyecto;
  int idPedido;

  factory EquiposPendiente.fromJson(Map<String, dynamic> json) =>
      EquiposPendiente(
        nombre: json["Nombre"],
        fecha: json["Fecha"],
        equipo: json["Equipo"],
        idProyecto: json["IDProyecto"],
        idPedido: json["IDPedido"],
      );

  Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Fecha": fecha,
        "Equipo": equipo,
        "IDProyecto": idProyecto,
        "IDPedido": idPedido,
      };
}
