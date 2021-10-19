import 'dart:convert';

List<EventModel> eventModelFromJson(String str) =>
    List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  EventModel({
    this.pkECod,
    this.eNombre,
    this.eEnlace,
  });

  final int? pkECod;
  final String? eNombre;
  final String? eEnlace;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        pkECod: json["PK_E_Cod"],
        eNombre: json["E_Nombre"],
        eEnlace: json["E_Enlace"],
      );

  Map<String, dynamic> toJson() => {
        "PK_E_Cod": pkECod,
        "E_Nombre": eNombre,
        "E_Enlace": eEnlace,
      };
}
