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

  String get nombre {
    return _preferences.getString('nombre') ?? 'Ricardo';
  }

  set nombre(String value) {
    _preferences.setString('nombre', value);
  }

  String get apellido {
    return _preferences.getString('apellido') ?? 'Villanueva';
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

  bool get carrusel {
    return _preferences.getBool('carrusel') ?? false;
  }

  set carrusel(bool value) {
    _preferences.setBool('carrusel', value);
  }
}
