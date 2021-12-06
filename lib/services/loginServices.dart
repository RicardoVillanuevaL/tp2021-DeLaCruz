import 'dart:convert';

import 'package:tp_2021_app/models/usuarioModel.dart';
import 'package:tp_2021_app/resources/strings.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  
  Future<UsuarioModel> getIniciarSecionAdministrador(
      String correo, String pass) async {
    var endpoint = Uri.https(
        URL, '/mobile/consulta/getIniciarSecionTrabajador/$correo/$pass');

    final response =
        await http.get(endpoint, headers: {"Content-Type": "application/json"});
    final List<UsuarioModel> decodedData = json.decode(response.body);
    final List<UsuarioModel> list = [];

    if (decodedData.isNotEmpty &&
        response.statusCode == 200 &&
        decodedData.length != 0) {
      decodedData.forEach((element) {
        list.add(element);
      });
    } else {
      var endpoint =
          Uri.https(URL, '/usuario/consulta/getIniciarSesion/$correo/$pass');

      final response2 = await http
          .get(endpoint, headers: {"Content-Type": "application/json"});

      final List<UsuarioModel> decodedData2 = json.decode(response2.body);

      if (decodedData2.isNotEmpty &&
          response2.statusCode == 200 &&
          decodedData2.length != 0) {
        decodedData2.forEach((element) {
          list.add(element);
        });
      } else {
        list.add(UsuarioModel(
            id: 0,
            nombre: 'Algo Ocurrio',
            apellido: 'Algo Ocurrio',
            rol: 'Algo Ocurrio',
            documento: 'Algo Ocurrio',
            token: 'Algo Ocurrio'));
      }
    }

    if (list[0].id != 0) {
      await guardarDatos(list[0]);
      await registrarToken(list[0].id!, '');
    }

    return list[0];
  }

  Future<bool> guardarDatos(UsuarioModel model) async {
    return true;
  }
  Future<bool> registrarToken(int id, String token) async{
    return true;
  }
}
