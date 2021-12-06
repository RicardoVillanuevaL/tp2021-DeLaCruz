import 'dart:convert';

List<UsuarioModel> usuarioModelFromJson(String str) => List<UsuarioModel>.from(json.decode(str).map((x) => UsuarioModel.fromJson(x)));

String usuarioModelToJson(List<UsuarioModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsuarioModel {
    UsuarioModel({
        this.apellido,
        this.nombre,
        this.documento,
        this.rol,
        this.id,
        this.token,
    });

    String? apellido;
    String? nombre;
    String? documento;
    String? rol;
    int? id;
    String? token;

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        apellido: json["apellido"],
        nombre: json["nombre"],
        documento: json["documento"],
        rol: json["rol"],
        id: json["ID"],
        token: json["token"] == null ? null : json["token"],
    );

    Map<String, dynamic> toJson() => {
        "apellido": apellido,
        "nombre": nombre,
        "documento": documento,
        "rol": rol,
        "ID": id,
        "token": token == null ? null : token,
    };
}
