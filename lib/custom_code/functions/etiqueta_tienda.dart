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

String etiquetaTienda(
  LatLng? ubicacion,
  int indice,
  int total,
) {
  // Card eyebrow: nearest store first, then "TIENDA 2 DE 6".
  if (tieneUbicacion(ubicacion) && indice == 0) {
    return 'TU TIENDA MÁS CERCANA';
  }
  return 'TIENDA ${indice + 1} DE $total';
}
