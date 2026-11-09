import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';

TiendaStruct? tiendaMasCercana(
  List<TiendaStruct> tiendas,
  LatLng? ubicacion,
) {
  // Without a location, the first store is shown as featured.
  if (tiendas.isEmpty) {
    return null;
  }
  if (!tieneUbicacion(ubicacion)) {
    return tiendas.first;
  }
  TiendaStruct cercana = tiendas.first;
  double mejor = distanciaKm(ubicacion, cercana.ubicacion);
  for (final tienda in tiendas) {
    final d = distanciaKm(ubicacion, tienda.ubicacion);
    if (d < mejor) {
      mejor = d;
      cercana = tienda;
    }
  }
  return cercana;
}
