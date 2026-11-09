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

List<TiendaStruct> tiendasDeEjemplo() {
  // Sample ModaMan stores in Costa Rica, until Firebase is connected.
  const img = 'https://dimg.dreamflow.cloud/v1/image/';
  return [
    TiendaStruct(
      id: 'avenida-central',
      nombre: 'ModaMan Avenida Central',
      direccion: 'Avenida Central, entre calles 1 y 3',
      zona: 'Distrito Carmen · San José',
      ciudad: 'San José',
      provincia: 'San José',
      ubicacion: LatLng(9.9329, -84.0782),
      telefono: '+50622223456',
      horarioTexto: 'Lun–Sáb: 10:00–20:00 · Dom: 11:00–18:00',
      aperturaLS: 600,
      cierreLS: 1200,
      aperturaDom: 660,
      cierreDom: 1080,
      estilos: ['Formal', 'Casual'],
      fotoUrl: img + 'menswear%20boutique%20interior%20warm%20wood%20suits',
    ),
    TiendaStruct(
      id: 'escazu',
      nombre: 'ModaMan Escazú',
      direccion: 'Boulevard de Escazú, 200 m oeste de la rotonda',
      zona: 'San Rafael de Escazú · San José',
      ciudad: 'Escazú',
      provincia: 'San José',
      ubicacion: LatLng(9.9437, -84.1428),
      telefono: '+50622894512',
      horarioTexto: 'Lun–Sáb: 10:00–21:00 · Dom: 11:00–19:00',
      aperturaLS: 600,
      cierreLS: 1260,
      aperturaDom: 660,
      cierreDom: 1140,
      estilos: ['Formal', 'Casual'],
      fotoUrl: img + 'modern%20mens%20clothing%20store%20front%20glass',
    ),
    TiendaStruct(
      id: 'curridabat',
      nombre: 'ModaMan Curridabat',
      direccion: 'Avenida Central de Curridabat, frente al parque',
      zona: 'Curridabat · San José',
      ciudad: 'Curridabat',
      provincia: 'San José',
      ubicacion: LatLng(9.9147, -84.0360),
      telefono: '+50622715580',
      horarioTexto: 'Lun–Sáb: 10:00–20:00 · Dom: 11:00–18:00',
      aperturaLS: 600,
      cierreLS: 1200,
      aperturaDom: 660,
      cierreDom: 1080,
      estilos: ['Casual', 'Deportiva'],
      fotoUrl: img + 'casual%20menswear%20store%20interior%20bright',
    ),
    TiendaStruct(
      id: 'heredia',
      nombre: 'ModaMan Heredia',
      direccion: 'Calle 7, costado norte del Parque Central',
      zona: 'Heredia centro · Heredia',
      ciudad: 'Heredia',
      provincia: 'Heredia',
      ubicacion: LatLng(9.9990, -84.1170),
      telefono: '+50622603321',
      horarioTexto: 'Lun–Sáb: 9:30–19:30 · Dom: cerrado',
      aperturaLS: 570,
      cierreLS: 1170,
      aperturaDom: 0,
      cierreDom: 0,
      estilos: ['Formal'],
      fotoUrl: img + 'tailored%20suits%20shop%20interior%20elegant',
    ),
    TiendaStruct(
      id: 'alajuela',
      nombre: 'ModaMan Alajuela',
      direccion: 'Avenida 2, 100 m sur de la Catedral',
      zona: 'Alajuela centro · Alajuela',
      ciudad: 'Alajuela',
      provincia: 'Alajuela',
      ubicacion: LatLng(10.0162, -84.2116),
      telefono: '+50624407788',
      horarioTexto: 'Lun–Sáb: 10:00–20:00 · Dom: 11:00–17:00',
      aperturaLS: 600,
      cierreLS: 1200,
      aperturaDom: 660,
      cierreDom: 1020,
      estilos: ['Casual'],
      fotoUrl: img + 'mens%20casual%20fashion%20store%20racks',
    ),
    TiendaStruct(
      id: 'cartago',
      nombre: 'ModaMan Cartago',
      direccion: 'Avenida 1, 50 m este de las Ruinas',
      zona: 'Cartago centro · Cartago',
      ciudad: 'Cartago',
      provincia: 'Cartago',
      ubicacion: LatLng(9.8644, -83.9194),
      telefono: '+50625519034',
      horarioTexto: 'Lun–Sáb: 10:00–19:00 · Dom: cerrado',
      aperturaLS: 600,
      cierreLS: 1140,
      aperturaDom: 0,
      cierreDom: 0,
      estilos: ['Formal', 'Casual'],
      fotoUrl: img + 'classic%20mens%20clothing%20boutique%20facade',
    ),
  ];
}
