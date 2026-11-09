// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';

Future<LatLng?> ubicacionSiPermitida() async {
  // Returns the device location only when permission is already granted.
  // It never shows the system prompt, so "Ahora no" (HU-7) is respected.
  try {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return null;
    }
    final permiso = await Geolocator.checkPermission();
    if (permiso != LocationPermission.always &&
        permiso != LocationPermission.whileInUse) {
      return null;
    }
    final posicion = await Geolocator.getCurrentPosition();
    return LatLng(posicion.latitude, posicion.longitude);
  } catch (_) {
    return null;
  }
}
