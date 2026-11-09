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

List<TiendaStruct> filtrarTiendas(
  List<TiendaStruct> tiendas,
  String? texto,
) {
  // Matches name, city, province or address, ignoring case and accents.
  String normalizar(String s) {
    const con = 'áéíóúüñÁÉÍÓÚÜÑ';
    const sin = 'aeiouunAEIOUUN';
    var r = s;
    for (var i = 0; i < con.length; i++) {
      r = r.replaceAll(con[i], sin[i]);
    }
    return r.toLowerCase().trim();
  }

  final q = normalizar(texto ?? '');
  if (q.isEmpty) {
    return tiendas;
  }
  return tiendas
      .where((t) =>
          normalizar(t.nombre).contains(q) ||
          normalizar(t.ciudad).contains(q) ||
          normalizar(t.provincia).contains(q) ||
          normalizar(t.direccion).contains(q))
      .toList();
}
