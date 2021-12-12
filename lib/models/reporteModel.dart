import 'dart:convert';

List<ReporteModel> reporteModelFromJson(String str) => List<ReporteModel>.from(
    json.decode(str).map((x) => ReporteModel.fromJson(x)));

String reporteModelToJson(List<ReporteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReporteModel {
  ReporteModel({
    this.id,
    this.nombreProyecto,
    this.empleado,
    this.reporte,
    required this.fechaHora,
    this.idProyecto,
  });

  int? id;
  String? nombreProyecto;
  String? empleado;
  String? reporte;
  DateTime fechaHora;
  int? idProyecto;

  factory ReporteModel.fromJson(Map<String, dynamic> json) => ReporteModel(
        id: json["id"],
        nombreProyecto: json["nombreProyecto"],
        empleado: json["empleado"],
        reporte: json["reporte"],
        fechaHora: DateTime.parse(json["fechaHora"]),
        idProyecto: json["idProyecto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombreProyecto": nombreProyecto,
        "empleado": empleado,
        "reporte": reporte,
        "fechaHora": fechaHora.toIso8601String(),
        "idProyecto": idProyecto,
      };
}
