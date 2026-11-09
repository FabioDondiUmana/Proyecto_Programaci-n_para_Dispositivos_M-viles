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

bool tieneUbicacion(LatLng? ubicacion) {
  // FlutterFlow reports 0,0 when the location is unknown or denied.
  if (ubicacion == null) {
    return false;
  }
  return !(ubicacion.latitude == 0 && ubicacion.longitude == 0);
}
