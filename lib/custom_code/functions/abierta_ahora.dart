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

bool abiertaAhora(TiendaStruct tienda) {
  final ahora = DateTime.now();
  final minutos = ahora.hour * 60 + ahora.minute;
  final domingo = ahora.weekday == DateTime.sunday;
  final apertura = domingo ? tienda.aperturaDom : tienda.aperturaLS;
  final cierre = domingo ? tienda.cierreDom : tienda.cierreLS;
  if (apertura == cierre) {
    return false;
  }
  return minutos >= apertura && minutos < cierre;
}
