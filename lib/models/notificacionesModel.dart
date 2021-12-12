import 'dart:convert';

List<NotificacionModel> notificacionModelFromJson(String str) => List<NotificacionModel>.from(json.decode(str).map((x) => NotificacionModel.fromJson(x)));

String notificacionModelToJson(List<NotificacionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificacionModel {
    NotificacionModel({
        this.pkNotificaciones,
        this.titulo,
        this.cuerpo,
        this.fkEmpleado,
    });

    int? pkNotificaciones;
    String? titulo;
    String? cuerpo;
    int? fkEmpleado;

    factory NotificacionModel.fromJson(Map<String, dynamic> json) => NotificacionModel(
        pkNotificaciones: json["PK_Notificaciones"],
        titulo: json["Titulo"],
        cuerpo: json["Cuerpo"],
        fkEmpleado: json["FK_Empleado"],
    );

    Map<String, dynamic> toJson() => {
        "PK_Notificaciones": pkNotificaciones,
        "Titulo": titulo,
        "Cuerpo": cuerpo,
        "FK_Empleado": fkEmpleado,
    };
}
