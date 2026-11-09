import '/components/nav_item/nav_item_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'barra_inferior_model.dart';
export 'barra_inferior_model.dart';

/// DSL component BarraInferior
class BarraInferiorWidget extends StatefulWidget {
  const BarraInferiorWidget({
    super.key,
    String? activa,
  }) : this.activa = activa ?? 'inicio';

  final String activa;

  @override
  State<BarraInferiorWidget> createState() => _BarraInferiorWidgetState();
}

class _BarraInferiorWidgetState extends State<BarraInferiorWidget> {
  late BarraInferiorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BarraInferiorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
        crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            width: double.infinity,
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.activa != 'inicio') {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(HomeScreenWidget.routeName);
                      }
                    },
                    child: wrapWithModel(
                      model: _model.navItemModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: NavItemWidget(
                        label: 'Inicio',
                        icon: Icon(
                          Icons.home_rounded,
                          color: widget.activa == 'inicio'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        target: 'inicio',
                        selected: widget.activa == 'inicio',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.activa != 'mapa') {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(StoreLocatorMapWidget.routeName);
                      }
                    },
                    child: wrapWithModel(
                      model: _model.navItemModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: NavItemWidget(
                        label: 'Mapa',
                        icon: Icon(
                          Icons.map_outlined,
                          color: widget.activa == 'mapa'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        target: 'mapa',
                        selected: widget.activa == 'mapa',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Favoritos estará disponible en la próxima versión',
                            style: TextStyle(),
                          ),
                          duration: Duration(milliseconds: 4000),
                        ),
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navItemModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: NavItemWidget(
                        label: 'Favoritos',
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        target: 'favoritos',
                        selected: false,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Perfil estará disponible en la próxima versión',
                            style: TextStyle(),
                          ),
                          duration: Duration(milliseconds: 4000),
                        ),
                      );
                    },
                    child: wrapWithModel(
                      model: _model.navItemModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: NavItemWidget(
                        label: 'Perfil',
                        icon: Icon(
                          Icons.person_outline_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        target: 'perfil',
                        selected: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
