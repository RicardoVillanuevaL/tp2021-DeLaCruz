// To parse this JSON data, do
//
//     final proyectoDetalleModel = proyectoDetalleModelFromJson(jsonString);

import 'dart:convert';

List<ProyectoDetalleModel> proyectoDetalleModelFromJson(String str) => List<ProyectoDetalleModel>.from(json.decode(str).map((x) => ProyectoDetalleModel.fromJson(x)));

String proyectoDetalleModelToJson(List<ProyectoDetalleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProyectoDetalleModel {
    ProyectoDetalleModel({
        this.empleado,
        this.nPedido,
        this.cliente,
        this.correo,
        this.fRegistro,
        this.estadoPedido,
        this.costoTotal,
        this.acuenta,
        this.estadoPago,
        this.evento,
        this.servicio,
        this.fEvento,
        this.horaEvento,
        this.direccion,
        this.descripcion,
        this.nombrePedido,
        this.observacion,
        this.ubicacion,
        this.latitud,
        this.longitud,
        this.fEvento2,
        this.horaEvento2,
        this.direccion2,
        this.ubicacion2,
        this.latitud2,
        this.longitud2,
    });

    String? empleado;
    int? nPedido;
    String? cliente;
    String? correo;
    String? fRegistro;
    String? estadoPedido;
    int? costoTotal;
    int? acuenta;
    String? estadoPago;
    String? evento;
    String? servicio;
    String? fEvento;
    String? horaEvento;
    String? direccion;
    String? descripcion;
    String? nombrePedido;
    String? observacion, ubicacion, latitud , longitud , fEvento2 , horaEvento2 , direccion2 , ubicacion2 , latitud2 , longitud2;

    factory ProyectoDetalleModel.fromJson(Map<String, dynamic> json) => ProyectoDetalleModel(
        empleado: json["Empleado"],
        nPedido: json["N_Pedido"],
        cliente: json["Cliente"],
        correo: json["correo"],
        fRegistro: json["F_Registro"],
        estadoPedido: json["EstadoPedido"],
        costoTotal: json["Costo_Total"],
        acuenta: json["Acuenta"],
        estadoPago: json["EstadoPago"],
        evento: json["Evento"],
        servicio: json["Servicio"],
        fEvento: json["F_Evento"],
        horaEvento: json["Hora_Evento"],
        direccion: json["Direccion"],
        descripcion: json["Descripcion"],
        nombrePedido: json["NombrePedido"],
        observacion: json["Observacion"],
        ubicacion: json["Ubicacion"],
        latitud: json["Latitud"],
        longitud: json["Longitud"],
        fEvento2: json["F_Evento2"],
        horaEvento2: json["Hora_Evento2"],
        direccion2: json["Direccion2"],
        ubicacion2: json["Ubicacion2"],
        latitud2: json["Latitud2"],
        longitud2: json["Longitud2"],
    );

    Map<String, dynamic> toJson() => {
        "Empleado": empleado,
        "N_Pedido": nPedido,
        "Cliente": cliente,
        "correo": correo,
        "F_Registro": fRegistro,
        "EstadoPedido": estadoPedido,
        "Costo_Total": costoTotal,
        "Acuenta": acuenta,
        "EstadoPago": estadoPago,
        "Evento": evento,
        "Servicio": servicio,
        "F_Evento": fEvento,
        "Hora_Evento": horaEvento,
        "Direccion": direccion,
        "Descripcion": descripcion,
        "NombrePedido": nombrePedido,
        "Observacion": observacion,
        "Ubicacion": ubicacion,
        "Latitud": latitud,
        "Longitud": longitud,
        "F_Evento2": fEvento2,
        "Hora_Evento2": horaEvento2,
        "Direccion2": direccion2,
        "Ubicacion2": ubicacion2,
        "Latitud2": latitud2,
        "Longitud2": longitud2,
    };
}
