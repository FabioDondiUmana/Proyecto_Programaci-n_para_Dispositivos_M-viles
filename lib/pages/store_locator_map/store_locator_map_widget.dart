import '/backend/schema/structs/index.dart';
import '/components/barra_inferior_widget.dart';
import '/components/button/button_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'store_locator_map_model.dart';
export 'store_locator_map_model.dart';

class StoreLocatorMapWidget extends StatefulWidget {
  const StoreLocatorMapWidget({super.key});

  static String routeName = 'StoreLocatorMap';
  static String routePath = '/mapa';

  @override
  State<StoreLocatorMapWidget> createState() => _StoreLocatorMapWidgetState();
}

class _StoreLocatorMapWidgetState extends State<StoreLocatorMapWidget> {
  late StoreLocatorMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoreLocatorMapModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loc = await actions.ubicacionSiPermitida();
      _model.ubicacion = _model.loc;
      safeSetState(() {});
      _model.lista = functions
          .ordenarPorDistancia(
              functions.tiendasDeEjemplo().toList(), _model.loc)
          .toList()
          .cast<TiendaStruct>();
      safeSetState(() {});
      _model.indice = 0;
      safeSetState(() {});
      _model.seleccionada = functions.tiendaMasCercana(
          functions.tiendasDeEjemplo().toList(), _model.loc);
      safeSetState(() {});
      _model.cargando = false;
      safeSetState(() {});
      if (functions.tieneUbicacion(_model.loc)) {
        FFAppState().ultimaUbicacion = _model.loc;
        safeSetState(() {});
        await _model.mapGoogleMapsController.future.then(
          (c) => c.animateCamera(
            CameraUpdate.newLatLng(_model.loc!.toGoogleMaps()),
          ),
        );
      }
    });

    _model.buscarInputTextController ??= TextEditingController();
    _model.buscarInputFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: AlignmentDirectional(-1.0, -1.0),
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: FlutterFlowGoogleMap(
                  controller: _model.mapGoogleMapsController,
                  onCameraIdle: (latLng) => _model.mapGoogleMapsCenter = latLng,
                  initialLocation: _model.mapGoogleMapsCenter ??=
                      LatLng(9.9333, -84.0833),
                  markers: _model.lista.asMap().entries.map(
                    (entry) {
                      final marker = entry.value;
                      return FlutterFlowMarker(
                        entry.key.toString(),
                        marker.ubicacion!,
                      );
                    },
                  ).toList(),
                  markerColor: GoogleMarkerColor.violet,
                  markerImage: MarkerImage(
                    imagePath: 'assets/images/marker_m.png',
                    isAssetImage: true,
                    size: 44.0 ?? 20,
                  ),
                  mapType: MapType.normal,
                  style: GoogleMapStyle.silver,
                  initialZoom: 11.5,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: false,
                  showLocation: true,
                  showCompass: false,
                  showMapToolbar: false,
                  showTraffic: false,
                  centerMapOnMarkerTap: true,
                  mapTakesGesturePreference: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.spaceBetween).flutterValue,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.center).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              'Tiendas cerca de ti',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              '${_model.lista.length.toString()} tiendas',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8.0,
                                color: Color(0x14000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 8.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  (FFMainAxisAlignment.start).flutterValue,
                              crossAxisAlignment:
                                  (FFCrossAxisAlignment.center).flutterValue,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller:
                                        _model.buscarInputTextController,
                                    focusNode: _model.buscarInputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.buscarInputTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        _model.lista = functions
                                            .ordenarPorDistancia(
                                                functions
                                                    .filtrarTiendas(
                                                        functions
                                                            .tiendasDeEjemplo()
                                                            .toList(),
                                                        _model
                                                            .buscarInputTextController
                                                            .text)
                                                    .toList(),
                                                _model.ubicacion)
                                            .toList()
                                            .cast<TiendaStruct>();
                                        safeSetState(() {});
                                        _model.indice = 0;
                                        safeSetState(() {});
                                        if (_model.lista.length > 0) {
                                          _model.seleccionada =
                                              functions.tiendaMasCercana(
                                                  functions
                                                      .filtrarTiendas(
                                                          functions
                                                              .tiendasDeEjemplo()
                                                              .toList(),
                                                          _model
                                                              .buscarInputTextController
                                                              .text)
                                                      .toList(),
                                                  _model.ubicacion);
                                          safeSetState(() {});
                                          await _model
                                              .mapGoogleMapsController.future
                                              .then(
                                            (c) => c.animateCamera(
                                              CameraUpdate.newLatLng(_model
                                                  .seleccionada!.ubicacion!
                                                  .toGoogleMaps()),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Buscar tienda',
                                      hintText: 'Ciudad, dirección o tienda',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      filled: true,
                                    ),
                                    style: TextStyle(),
                                    maxLines: null,
                                    validator: _model
                                        .buscarInputTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Los filtros por provincia llegarán en la próxima versión',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.tune_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .onPrimary,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                    crossAxisAlignment:
                        (FFCrossAxisAlignment.stretch).flutterValue,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (functions.tieneUbicacion(_model.ubicacion)) {
                                await _model.mapGoogleMapsController.future
                                    .then(
                                  (c) => c.animateCamera(
                                    CameraUpdate.newLatLng(
                                        _model.ubicacion!.toGoogleMaps()),
                                  ),
                                );
                              } else {
                                await requestPermission(locationPermission);
                                _model.nueva =
                                    await actions.ubicacionSiPermitida();
                                if (functions.tieneUbicacion(_model.nueva)) {
                                  _model.ubicacion = _model.nueva;
                                  safeSetState(() {});
                                  FFAppState().ultimaUbicacion = _model.nueva;
                                  safeSetState(() {});
                                  _model.lista = functions
                                      .ordenarPorDistancia(
                                          functions
                                              .filtrarTiendas(
                                                  functions
                                                      .tiendasDeEjemplo()
                                                      .toList(),
                                                  _model
                                                      .buscarInputTextController
                                                      .text)
                                              .toList(),
                                          _model.nueva)
                                      .toList()
                                      .cast<TiendaStruct>();
                                  safeSetState(() {});
                                  _model.indice = 0;
                                  safeSetState(() {});
                                  _model.seleccionada =
                                      functions.tiendaMasCercana(
                                          functions
                                              .filtrarTiendas(
                                                  functions
                                                      .tiendasDeEjemplo()
                                                      .toList(),
                                                  _model
                                                      .buscarInputTextController
                                                      .text)
                                              .toList(),
                                          _model.nueva);
                                  safeSetState(() {});
                                  await _model.mapGoogleMapsController.future
                                      .then(
                                    (c) => c.animateCamera(
                                      CameraUpdate.newLatLng(
                                          _model.nueva!.toGoogleMaps()),
                                    ),
                                  );
                                } else if (isWeb) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Permite la ubicación desde el candado de la barra de direcciones del navegador.',
                                        style: TextStyle(),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                    ),
                                  );
                                } else {
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title:
                                                Text('Ubicación desactivada'),
                                            content: Text(
                                                'Para ver la tienda más cercana, activa la ubicación o permite el acceso en Ajustes.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Ahora no'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Abrir Ajustes'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    await actions.abrirAjustesUbicacion();
                                  }
                                }
                              }

                              safeSetState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 10.0, 14.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Icon(
                                      Icons.my_location_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 18.0,
                                    ),
                                    Text(
                                      functions.tieneUbicacion(_model.ubicacion)
                                          ? 'Mi ubicación'
                                          : 'Activar ubicación',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8.0,
                                color: Color(0x14000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:
                                  (FFMainAxisAlignment.start).flutterValue,
                              crossAxisAlignment:
                                  (FFCrossAxisAlignment.stretch).flutterValue,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                if (_model.cargando ?? true)
                                  CircularPercentIndicator(
                                    percent: 0.0,
                                    radius: 14.0,
                                    lineWidth: 3.0,
                                    animation: false,
                                    animateFromLastPercent: true,
                                    progressColor:
                                        FlutterFlowTheme.of(context).primary,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                if (!_model.cargando! &&
                                    (_model.lista.length == 0))
                                  Text(
                                    'No hay tiendas que coincidan con tu búsqueda. Prueba con otra ciudad o provincia.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                if (!_model.cargando! &&
                                    (_model.lista.length > 0))
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        (FFMainAxisAlignment.start)
                                            .flutterValue,
                                    crossAxisAlignment:
                                        (FFCrossAxisAlignment.stretch)
                                            .flutterValue,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            (FFMainAxisAlignment.start)
                                                .flutterValue,
                                        crossAxisAlignment:
                                            (FFCrossAxisAlignment.center)
                                                .flutterValue,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              functions.etiquetaTienda(
                                                  _model.ubicacion,
                                                  _model.indice!,
                                                  _model.lista.length),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .eyebrow
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .eyebrow
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .eyebrow
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          if (_model.lista.length > 1)
                                            FlutterFlowIconButton(
                                              buttonSize: 36.0,
                                              icon: Icon(
                                                Icons.chevron_left_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 22.0,
                                              ),
                                              onPressed: () async {
                                                if (_model.indice! > 0) {
                                                  _model.indice =
                                                      _model.indice! + -1;
                                                  safeSetState(() {});
                                                } else {
                                                  _model.indice = _model.lista
                                                          .toList()
                                                          .length -
                                                      1;
                                                  safeSetState(() {});
                                                }

                                                _model.seleccionada = _model
                                                    .lista
                                                    .elementAtOrNull(
                                                        _model.indice!);
                                                safeSetState(() {});
                                                await _model
                                                    .mapGoogleMapsController
                                                    .future
                                                    .then(
                                                  (c) => c.animateCamera(
                                                    CameraUpdate.newLatLng(
                                                        _model.seleccionada!
                                                            .ubicacion!
                                                            .toGoogleMaps()),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (_model.lista.length > 1)
                                            FlutterFlowIconButton(
                                              buttonSize: 36.0,
                                              icon: Icon(
                                                Icons.chevron_right_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 22.0,
                                              ),
                                              onPressed: () async {
                                                if (_model.indice! <
                                                    (_model.lista
                                                            .toList()
                                                            .length -
                                                        1)) {
                                                  _model.indice =
                                                      _model.indice! + 1;
                                                  safeSetState(() {});
                                                } else {
                                                  _model.indice = 0;
                                                  safeSetState(() {});
                                                }

                                                _model.seleccionada = _model
                                                    .lista
                                                    .elementAtOrNull(
                                                        _model.indice!);
                                                safeSetState(() {});
                                                await _model
                                                    .mapGoogleMapsController
                                                    .future
                                                    .then(
                                                  (c) => c.animateCamera(
                                                    CameraUpdate.newLatLng(
                                                        _model.seleccionada!
                                                            .ubicacion!
                                                            .toGoogleMaps()),
                                                  ),
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            (FFMainAxisAlignment.start)
                                                .flutterValue,
                                        crossAxisAlignment:
                                            (FFCrossAxisAlignment.center)
                                                .flutterValue,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Container(
                                              width: 72.0,
                                              height: 72.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl: _model
                                                    .seleccionada!.fotoUrl,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  (FFMainAxisAlignment.start)
                                                      .flutterValue,
                                              crossAxisAlignment:
                                                  (FFCrossAxisAlignment.start)
                                                      .flutterValue,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  _model.seleccionada!.nombre,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Text(
                                                  _model
                                                      .seleccionada!.direccion,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      (FFMainAxisAlignment
                                                              .start)
                                                          .flutterValue,
                                                  crossAxisAlignment:
                                                      (FFCrossAxisAlignment
                                                              .center)
                                                          .flutterValue,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    if (functions
                                                        .tieneUbicacion(
                                                            _model.ubicacion))
                                                      Text(
                                                        functions.textoDistancia(
                                                            _model.ubicacion,
                                                            _model.seleccionada
                                                                ?.ubicacion),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    Container(
                                                      width: 6.0,
                                                      height: 6.0,
                                                      decoration: BoxDecoration(
                                                        color: functions
                                                                .abiertaAhora(_model
                                                                    .seleccionada!)
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .amber
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        functions.estadoApertura(
                                                            _model
                                                                .seleccionada!),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            StoreDetailWidget.routeName,
                                            queryParameters: {
                                              'tienda': serializeParam(
                                                _model.seleccionada,
                                                ParamType.DataStruct,
                                              ),
                                              'distancia': serializeParam(
                                                functions.textoDistancia(
                                                    _model.ubicacion,
                                                    _model.seleccionada
                                                        ?.ubicacion),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.buttonModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ButtonWidget(
                                            icon: Icon(
                                              Icons.arrow_forward_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onPrimary,
                                              size: 20.0,
                                            ),
                                            iconPresent: true,
                                            iconEndPresent: false,
                                            content: 'Ver detalles',
                                            variant: 'primary',
                                            size: 'large',
                                            fullWidth: true,
                                            loading: false,
                                            disabled: false,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.barraInferiorModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BarraInferiorWidget(
                          activa: 'mapa',
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
