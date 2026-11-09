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

String textoDistancia(
  LatLng? ubicacion,
  LatLng? destino,
) {
  // "850 m" or "2,4 km"; empty without a location.
  if (!tieneUbicacion(ubicacion) || destino == null) {
    return '';
  }
  final km = distanciaKm(ubicacion, destino);
  if (km < 1) {
    return '${(km * 1000).round()} m';
  }
  return '${km.toStringAsFixed(1).replaceAll('.', ',')} km';
}
