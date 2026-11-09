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

String formatoTelefono(String telefono) {
  // "+50622223456" -> "+506 2222 3456".
  final d = telefono.replaceAll(RegExp(r'[^0-9]'), '');
  if (d.length == 11 && d.startsWith('506')) {
    return '+506 ${d.substring(3, 7)} ${d.substring(7)}';
  }
  return telefono;
}
