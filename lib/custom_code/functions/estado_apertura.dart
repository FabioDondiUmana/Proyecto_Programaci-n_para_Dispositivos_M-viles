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

String estadoApertura(TiendaStruct tienda) {
  // "Abierta hasta las 20:00" or "Cerrada · abre a las 10:00".
  String hora(int m) => '${m ~/ 60}:${(m % 60).toString().padLeft(2, '0')}';
  final ahora = DateTime.now();
  final minutos = ahora.hour * 60 + ahora.minute;
  final domingo = ahora.weekday == DateTime.sunday;
  final apertura = domingo ? tienda.aperturaDom : tienda.aperturaLS;
  final cierre = domingo ? tienda.cierreDom : tienda.cierreLS;
  if (abiertaAhora(tienda)) {
    return 'Abierta hasta las ${hora(cierre)}';
  }
  if (apertura != cierre && minutos < apertura) {
    return 'Cerrada · abre a las ${hora(apertura)}';
  }
  final manana = ahora.add(const Duration(days: 1));
  final domingoManana = manana.weekday == DateTime.sunday;
  final aperturaManana = domingoManana ? tienda.aperturaDom : tienda.aperturaLS;
  final cierreManana = domingoManana ? tienda.cierreDom : tienda.cierreLS;
  if (aperturaManana == cierreManana) {
    return 'Cerrada hoy';
  }
  return 'Cerrada · abre mañana a las ${hora(aperturaManana)}';
}
