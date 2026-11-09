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

double distanciaKm(
  LatLng? origen,
  LatLng? destino,
) {
  // Haversine distance in kilometres.
  if (origen == null || destino == null) {
    return 0;
  }
  const radioTierra = 6371.0;
  final dLat = (destino.latitude - origen.latitude) * math.pi / 180;
  final dLng = (destino.longitude - origen.longitude) * math.pi / 180;
  final lat1 = origen.latitude * math.pi / 180;
  final lat2 = destino.latitude * math.pi / 180;
  final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1) * math.cos(lat2) * math.sin(dLng / 2) * math.sin(dLng / 2);
  return radioTierra * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
}
