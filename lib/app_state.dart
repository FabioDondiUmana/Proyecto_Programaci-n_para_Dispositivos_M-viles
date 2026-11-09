import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favoritos = prefs.getStringList('ff_favoritos') ?? _favoritos;
    });
    _safeInit(() {
      _permisoRespondido =
          prefs.getBool('ff_permisoRespondido') ?? _permisoRespondido;
    });
    _safeInit(() {
      _ultimaUbicacion =
          latLngFromString(prefs.getString('ff_ultimaUbicacion')) ??
              _ultimaUbicacion;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// App state favoritos
  List<String> _favoritos = [];
  List<String> get favoritos => _favoritos;
  set favoritos(List<String> value) {
    _favoritos = value;
    prefs.setStringList('ff_favoritos', value);
  }

  void addToFavoritos(String value) {
    favoritos.add(value);
    prefs.setStringList('ff_favoritos', _favoritos);
  }

  void removeFromFavoritos(String value) {
    favoritos.remove(value);
    prefs.setStringList('ff_favoritos', _favoritos);
  }

  void removeAtIndexFromFavoritos(int index) {
    favoritos.removeAt(index);
    prefs.setStringList('ff_favoritos', _favoritos);
  }

  void updateFavoritosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favoritos[index] = updateFn(_favoritos[index]);
    prefs.setStringList('ff_favoritos', _favoritos);
  }

  void insertAtIndexInFavoritos(int index, String value) {
    favoritos.insert(index, value);
    prefs.setStringList('ff_favoritos', _favoritos);
  }

  /// App state permisoRespondido
  bool _permisoRespondido = false;
  bool get permisoRespondido => _permisoRespondido;
  set permisoRespondido(bool value) {
    _permisoRespondido = value;
    prefs.setBool('ff_permisoRespondido', value);
  }

  /// App state ultimaUbicacion
  LatLng? _ultimaUbicacion;
  LatLng? get ultimaUbicacion => _ultimaUbicacion;
  set ultimaUbicacion(LatLng? value) {
    _ultimaUbicacion = value;
    value != null
        ? prefs.setString('ff_ultimaUbicacion', value.serialize())
        : prefs.remove('ff_ultimaUbicacion');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
