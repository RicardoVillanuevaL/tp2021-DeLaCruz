import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _preferences;

  initPrefs() async {
    this._preferences = await SharedPreferences.getInstance();
  }

  String get token {
    return _preferences.getString('token') ?? '';
  }

  set token(String value) {
    _preferences.setString('token', value);
  }

  String get cellToken {
    return _preferences.getString('cellToken') ?? '';
  }

  set cellToken(String value) {
    _preferences.setString('cellToken', value);
  }

  String get nombre {
    return _preferences.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _preferences.setString('nombre', value);
  }

  String get apellido {
    return _preferences.getString('apellido') ?? '';
  }

  set apellido(String value) {
    _preferences.setString('apellido', value);
  }

  String get dni {
    return _preferences.getString('dni') ?? '';
  }

  set dni(String value) {
    _preferences.setString('dni', value);
  }

  String get rol {
    return _preferences.getString('rol') ?? '';
  }

  set rol(String value) {
    _preferences.setString('rol', value);
  }

  int get id {
    return _preferences.getInt('id') ?? 0;
  }

  set id(int value) {
    _preferences.setInt('id', value);
  }

  bool get carrusel {
    return _preferences.getBool('carrusel') ?? false;
  }

  set carrusel(bool value) {
    _preferences.setBool('carrusel', value);
  }

   bool get admin {
    return _preferences.getBool('admin') ?? false;
  }

  set admin(bool value) {
    _preferences.setBool('admin', value);
  }

  String get telefono {
    return _preferences.getString('telefono') ?? '';
  }

  set telefono(String value) {
    _preferences.setString('telefono', value);
  }

  String get correo {
    return _preferences.getString('correo') ?? '';
  }

  set correo(String value) {
    _preferences.setString('correo', value);
  }
}
