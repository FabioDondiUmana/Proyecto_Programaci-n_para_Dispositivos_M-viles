// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Struct Tienda
class TiendaStruct extends BaseStruct {
  TiendaStruct({
    /// Tienda.id
    String? id,

    /// Tienda.nombre
    String? nombre,

    /// Tienda.direccion
    String? direccion,

    /// Tienda.zona
    String? zona,

    /// Tienda.ciudad
    String? ciudad,

    /// Tienda.provincia
    String? provincia,

    /// Tienda.ubicacion
    LatLng? ubicacion,

    /// Tienda.telefono
    String? telefono,

    /// Tienda.horarioTexto
    String? horarioTexto,

    /// Tienda.aperturaLS
    int? aperturaLS,

    /// Tienda.cierreLS
    int? cierreLS,

    /// Tienda.aperturaDom
    int? aperturaDom,

    /// Tienda.cierreDom
    int? cierreDom,

    /// Tienda.estilos
    List<String>? estilos,

    /// Tienda.fotoUrl
    String? fotoUrl,
  })  : _id = id,
        _nombre = nombre,
        _direccion = direccion,
        _zona = zona,
        _ciudad = ciudad,
        _provincia = provincia,
        _ubicacion = ubicacion,
        _telefono = telefono,
        _horarioTexto = horarioTexto,
        _aperturaLS = aperturaLS,
        _cierreLS = cierreLS,
        _aperturaDom = aperturaDom,
        _cierreDom = cierreDom,
        _estilos = estilos,
        _fotoUrl = fotoUrl;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  set direccion(String? val) => _direccion = val;

  bool hasDireccion() => _direccion != null;

  // "zona" field.
  String? _zona;
  String get zona => _zona ?? '';
  set zona(String? val) => _zona = val;

  bool hasZona() => _zona != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  set ciudad(String? val) => _ciudad = val;

  bool hasCiudad() => _ciudad != null;

  // "provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  set provincia(String? val) => _provincia = val;

  bool hasProvincia() => _provincia != null;

  // "ubicacion" field.
  LatLng? _ubicacion;
  LatLng? get ubicacion => _ubicacion;
  set ubicacion(LatLng? val) => _ubicacion = val;

  bool hasUbicacion() => _ubicacion != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  set telefono(String? val) => _telefono = val;

  bool hasTelefono() => _telefono != null;

  // "horarioTexto" field.
  String? _horarioTexto;
  String get horarioTexto => _horarioTexto ?? '';
  set horarioTexto(String? val) => _horarioTexto = val;

  bool hasHorarioTexto() => _horarioTexto != null;

  // "aperturaLS" field.
  int? _aperturaLS;
  int get aperturaLS => _aperturaLS ?? 0;
  set aperturaLS(int? val) => _aperturaLS = val;

  void incrementAperturaLS(int amount) => aperturaLS = aperturaLS + amount;

  bool hasAperturaLS() => _aperturaLS != null;

  // "cierreLS" field.
  int? _cierreLS;
  int get cierreLS => _cierreLS ?? 0;
  set cierreLS(int? val) => _cierreLS = val;

  void incrementCierreLS(int amount) => cierreLS = cierreLS + amount;

  bool hasCierreLS() => _cierreLS != null;

  // "aperturaDom" field.
  int? _aperturaDom;
  int get aperturaDom => _aperturaDom ?? 0;
  set aperturaDom(int? val) => _aperturaDom = val;

  void incrementAperturaDom(int amount) => aperturaDom = aperturaDom + amount;

  bool hasAperturaDom() => _aperturaDom != null;

  // "cierreDom" field.
  int? _cierreDom;
  int get cierreDom => _cierreDom ?? 0;
  set cierreDom(int? val) => _cierreDom = val;

  void incrementCierreDom(int amount) => cierreDom = cierreDom + amount;

  bool hasCierreDom() => _cierreDom != null;

  // "estilos" field.
  List<String>? _estilos;
  List<String> get estilos => _estilos ?? const [];
  set estilos(List<String>? val) => _estilos = val;

  void updateEstilos(Function(List<String>) updateFn) {
    updateFn(_estilos ??= []);
  }

  bool hasEstilos() => _estilos != null;

  // "fotoUrl" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  set fotoUrl(String? val) => _fotoUrl = val;

  bool hasFotoUrl() => _fotoUrl != null;

  static TiendaStruct fromMap(Map<String, dynamic> data) => TiendaStruct(
        id: data['id'] as String?,
        nombre: data['nombre'] as String?,
        direccion: data['direccion'] as String?,
        zona: data['zona'] as String?,
        ciudad: data['ciudad'] as String?,
        provincia: data['provincia'] as String?,
        ubicacion: data['ubicacion'] as LatLng?,
        telefono: data['telefono'] as String?,
        horarioTexto: data['horarioTexto'] as String?,
        aperturaLS: castToType<int>(data['aperturaLS']),
        cierreLS: castToType<int>(data['cierreLS']),
        aperturaDom: castToType<int>(data['aperturaDom']),
        cierreDom: castToType<int>(data['cierreDom']),
        estilos: getDataList(data['estilos']),
        fotoUrl: data['fotoUrl'] as String?,
      );

  static TiendaStruct? maybeFromMap(dynamic data) =>
      data is Map ? TiendaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nombre': _nombre,
        'direccion': _direccion,
        'zona': _zona,
        'ciudad': _ciudad,
        'provincia': _provincia,
        'ubicacion': _ubicacion,
        'telefono': _telefono,
        'horarioTexto': _horarioTexto,
        'aperturaLS': _aperturaLS,
        'cierreLS': _cierreLS,
        'aperturaDom': _aperturaDom,
        'cierreDom': _cierreDom,
        'estilos': _estilos,
        'fotoUrl': _fotoUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'direccion': serializeParam(
          _direccion,
          ParamType.String,
        ),
        'zona': serializeParam(
          _zona,
          ParamType.String,
        ),
        'ciudad': serializeParam(
          _ciudad,
          ParamType.String,
        ),
        'provincia': serializeParam(
          _provincia,
          ParamType.String,
        ),
        'ubicacion': serializeParam(
          _ubicacion,
          ParamType.LatLng,
        ),
        'telefono': serializeParam(
          _telefono,
          ParamType.String,
        ),
        'horarioTexto': serializeParam(
          _horarioTexto,
          ParamType.String,
        ),
        'aperturaLS': serializeParam(
          _aperturaLS,
          ParamType.int,
        ),
        'cierreLS': serializeParam(
          _cierreLS,
          ParamType.int,
        ),
        'aperturaDom': serializeParam(
          _aperturaDom,
          ParamType.int,
        ),
        'cierreDom': serializeParam(
          _cierreDom,
          ParamType.int,
        ),
        'estilos': serializeParam(
          _estilos,
          ParamType.String,
          isList: true,
        ),
        'fotoUrl': serializeParam(
          _fotoUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static TiendaStruct fromSerializableMap(Map<String, dynamic> data) =>
      TiendaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        direccion: deserializeParam(
          data['direccion'],
          ParamType.String,
          false,
        ),
        zona: deserializeParam(
          data['zona'],
          ParamType.String,
          false,
        ),
        ciudad: deserializeParam(
          data['ciudad'],
          ParamType.String,
          false,
        ),
        provincia: deserializeParam(
          data['provincia'],
          ParamType.String,
          false,
        ),
        ubicacion: deserializeParam(
          data['ubicacion'],
          ParamType.LatLng,
          false,
        ),
        telefono: deserializeParam(
          data['telefono'],
          ParamType.String,
          false,
        ),
        horarioTexto: deserializeParam(
          data['horarioTexto'],
          ParamType.String,
          false,
        ),
        aperturaLS: deserializeParam(
          data['aperturaLS'],
          ParamType.int,
          false,
        ),
        cierreLS: deserializeParam(
          data['cierreLS'],
          ParamType.int,
          false,
        ),
        aperturaDom: deserializeParam(
          data['aperturaDom'],
          ParamType.int,
          false,
        ),
        cierreDom: deserializeParam(
          data['cierreDom'],
          ParamType.int,
          false,
        ),
        estilos: deserializeParam<String>(
          data['estilos'],
          ParamType.String,
          true,
        ),
        fotoUrl: deserializeParam(
          data['fotoUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TiendaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TiendaStruct &&
        id == other.id &&
        nombre == other.nombre &&
        direccion == other.direccion &&
        zona == other.zona &&
        ciudad == other.ciudad &&
        provincia == other.provincia &&
        ubicacion == other.ubicacion &&
        telefono == other.telefono &&
        horarioTexto == other.horarioTexto &&
        aperturaLS == other.aperturaLS &&
        cierreLS == other.cierreLS &&
        aperturaDom == other.aperturaDom &&
        cierreDom == other.cierreDom &&
        listEquality.equals(estilos, other.estilos) &&
        fotoUrl == other.fotoUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        nombre,
        direccion,
        zona,
        ciudad,
        provincia,
        ubicacion,
        telefono,
        horarioTexto,
        aperturaLS,
        cierreLS,
        aperturaDom,
        cierreDom,
        const ListEquality().hash(estilos),
        fotoUrl
      ]);
}

TiendaStruct createTiendaStruct({
  String? id,
  String? nombre,
  String? direccion,
  String? zona,
  String? ciudad,
  String? provincia,
  LatLng? ubicacion,
  String? telefono,
  String? horarioTexto,
  int? aperturaLS,
  int? cierreLS,
  int? aperturaDom,
  int? cierreDom,
  String? fotoUrl,
}) =>
    TiendaStruct(
      id: id,
      nombre: nombre,
      direccion: direccion,
      zona: zona,
      ciudad: ciudad,
      provincia: provincia,
      ubicacion: ubicacion,
      telefono: telefono,
      horarioTexto: horarioTexto,
      aperturaLS: aperturaLS,
      cierreLS: cierreLS,
      aperturaDom: aperturaDom,
      cierreDom: cierreDom,
      fotoUrl: fotoUrl,
    );
