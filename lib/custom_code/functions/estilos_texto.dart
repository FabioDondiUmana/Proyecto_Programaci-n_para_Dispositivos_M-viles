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

String estilosTexto(List<String> estilos) {
  // ["Formal", "Casual"] -> "Formal y casual".
  if (estilos.isEmpty) {
    return '';
  }
  final partes = [
    estilos.first,
    ...estilos.skip(1).map((e) => e.toLowerCase()),
  ];
  if (partes.length == 1) {
    return partes.first;
  }
  return '${partes.sublist(0, partes.length - 1).join(', ')} y ${partes.last}';
}
