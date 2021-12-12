import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tp_2021_app/core/sharedPreferences.dart';
import 'package:tp_2021_app/resources/strings.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  PreferenciasUsuario prefs = PreferenciasUsuario();
  final preferencias = PreferenciasUsuario();

  login(String correo, String pass) async {
    final cuerpo = {
      "correo": correo,
      "password": pass,
    };
    var endpoint = Uri.https(URL, '/loginTrabajador');

    final resp = await http.post(endpoint, body: jsonEncode(cuerpo), headers: {
      "Content-Type": "application/json",
    });

    final decodedResp = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      if (decodedResp.containsKey('Status')) {
        
        var endpointAdmin = Uri.https(URL, '/loginAdmin');
        final respAdmin =
            await http.post(endpointAdmin, body: jsonEncode(cuerpo), headers: {
          "Content-Type": "application/json",
        });

        final decodedRes = jsonDecode(respAdmin.body);
        if (respAdmin.statusCode == 200) {
          if (decodedRes.containsKey('Status')) {
            print(decodedRes);
            return {'ok': false, 'mensaje': decodedRes['Status']};
          } else if (decodedRes.containsKey('token')) {
            final token = decodedRes['token'] ?? '';
            final nombre = decodedRes['datos']['U_Nombre'] ?? '';
            final apellido = decodedRes['datos']['U_Apellido'] ?? '';
            final dni = decodedRes['datos']['U_Numero_Documento'] ?? '';
            final rol = decodedRes['datos']['Rol_Nombre'] ?? '';
            final id = decodedRes['datos']['PK_Permiso_Cod'] ?? 0;
            final telefono = decodedRes['datos']['U_Celular'] ?? '';
            final correo = decodedRes['datos']['U_Correo'] ?? '';
            guardarDatos(Datos(
                apellido: apellido,
                documento: dni,
                id: id,
                nombre: nombre,
                rol: rol,
                token: token,
                correo: correo,
                telefono: telefono,
                admin: true));

            await registrarToken(id, token, 'Admin');
            //await _session.set(prefs.token, 86400);
            await guardarTokencCell(id,  'Admin');

            return {'ok': true, 'mensaje': 'Ingreso exitoso'};
          }
        } else {
          return {'ok': false, 'mensaje': 'error al ingresar datos'};
        }
      } else if (decodedResp.containsKey('token')) {
        final token = decodedResp['token'] ?? '';
        final nombre = decodedResp['datos']['U_Nombre'] ?? '';
        final apellido = decodedResp['datos']['U_Apellido'] ?? '';
        final dni = decodedResp['datos']['U_Numero_Documento'] ?? '';
        final cargo = decodedResp['datos']['Car_Nombre'] ?? '';
        final id = decodedResp['datos']['PK_Em_Cod'] ?? 0;
        final telefono = decodedResp['datos']['U_Celular'] ?? '';
        final correo = decodedResp['datos']['U_Correo'] ?? '';
        guardarDatos(Datos(
            apellido: apellido,
            documento: dni,
            id: id,
            nombre: nombre,
            rol: cargo,
            token: token,
            correo: correo,
            telefono: telefono,
            admin: false));

        await registrarToken(id, token, 'Empleado');
        //await _session.set(prefs.token, 86400);
        print( 'POR QUE NO TE GUARDAS ${preferencias.cellToken}');
        await guardarTokencCell(id,  'Empleado');

        return {'ok': true, 'mensaje': 'Ingreso exitoso'};
      }
    } else {
      ////////////// ADMIN ////////////////////
      var endpointAdmin = Uri.https(URL, '/loginAdmin');
      final respAdmin =
          await http.post(endpointAdmin, body: jsonEncode(cuerpo), headers: {
        "Content-Type": "application/json",
      });

      final decodedResp = jsonDecode(respAdmin.body);
      if (respAdmin.statusCode == 200) {
        if (decodedResp.containsKey('Status')) {
          print(decodedResp);
          return {'ok': false, 'mensaje': decodedResp['Status']};
        } else if (decodedResp.containsKey('token')) {
          final token = decodedResp['token'] ?? '';
          final nombre = decodedResp['datos']['U_Nombre'] ?? '';
          final apellido = decodedResp['datos']['U_Apellido'] ?? '';
          final dni = decodedResp['datos']['U_Numero_Documento'] ?? '';
          final rol = decodedResp['datos']['Rol_Nombre'] ?? '';
          final id = decodedResp['datos']['PK_Permiso_Cod'] ?? 0;
          final telefono = decodedResp['datos']['U_Celular'] ?? '';
          final correo = decodedResp['datos']['U_Correo'] ?? '';
          guardarDatos(Datos(
              apellido: apellido,
              documento: dni,
              id: id,
              nombre: nombre,
              rol: rol,
              token: token,
              correo: correo,
              telefono: telefono,
              admin: true));

          await registrarToken(id, token, 'Admin');
          //await _session.set(prefs.token, 86400);
          await guardarTokencCell(id, 'Admin');

          return {'ok': true, 'mensaje': 'Ingreso exitoso'};
        }
      } else {
        return {'ok': false, 'mensaje': 'error al ingresar datos'};
      }
    }
  }

  loginAdmin(String correo, String pass) async {}

  Future<bool> guardarDatos(Datos model) async {
    prefs.token = model.token ?? 'token';
    prefs.nombre = model.nombre!;
    prefs.apellido = model.apellido!;
    prefs.dni = model.documento!;
    prefs.rol = model.rol!;
    prefs.id = model.id!;
    prefs.telefono = model.telefono!;
    prefs.correo = model.correo!;
    prefs.admin = model.admin!;
    return true;
  }

  Future<dynamic> registrarToken(int id, String token, String rol) async {
    try {
      Uri endpoint = Uri.https(URL, '/registrartokenEmpleado');

      final cuerpo = {'newtoken': token, 'id': id};
      switch (rol) {
        case 'Empleado':
          endpoint = Uri.https(URL, '/registrartokenEmpleado');
          break;
        case 'Admin':
          endpoint = Uri.https(URL, '/registrartokenAdmin');
          break;
        default:
      }

      final resp = await http.put(endpoint, body: jsonEncode(cuerpo), headers: {
        "Content-Type": "application/json",
      });

      print(resp.body);

      // final parsed = jsonDecode(resp.body);
      // if (parsed.containsKey('newtoken')) {
      //   return parsed;
      // } else {
      //   return null;
      // }
    } on PlatformException catch (e) {
      print('ERROR+${e.code}:${e.message}');
      return;
    }
  }

  Future<dynamic> guardarTokencCell(
      int id, String rol) async {

    try {
      Uri endpoint = Uri.https(URL, '/actualizartokenEmpleado');

      final cuerpo = {'newtoken': preferencias.cellToken, 'id': id};
      print(cuerpo);
      switch (rol) {
        case 'Empleado':
          endpoint = Uri.https(URL, '/actualizartokenEmpleado');
          break;
        case 'Admin':
          endpoint = Uri.https(URL, '/actualizartokenAdmin');
          break;
        default:
      }

      final resp = await http.put(endpoint, body: jsonEncode(cuerpo), headers: {
        "Content-Type": "application/json",
      });

      print(resp.body);
      // if (parsed.containsKey('newtoken')) {
      //   return parsed;
      // } else {
      //   return null;
      // }
    } on PlatformException catch (e) {
      print('ERROR+${e.code}:${e.message}');
      return;
    }
  }
}

final log = LoginServices();

class Datos {
  Datos(
      {this.token,
      this.documento,
      this.rol,
      this.id,
      this.apellido,
      this.correo,
      this.nombre,
      this.telefono,
      this.admin});

  String? apellido;
  String? nombre;
  String? documento;
  String? rol;
  int? id;
  String? token;
  String?  correo, telefono;
  bool? admin;
}
