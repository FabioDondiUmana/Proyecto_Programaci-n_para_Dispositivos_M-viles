import '/backend/schema/structs/index.dart';
import '/components/barra_inferior_widget.dart';
import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'store_locator_map_widget.dart' show StoreLocatorMapWidget;
import 'package:flutter/material.dart';

class StoreLocatorMapModel extends FlutterFlowModel<StoreLocatorMapWidget> {
  ///  Local state fields for this page.

  LatLng? ubicacion;

  TiendaStruct? seleccionada;
  void updateSeleccionadaStruct(Function(TiendaStruct) updateFn) {
    updateFn(seleccionada ??= TiendaStruct());
  }

  List<TiendaStruct> lista = [];
  void addToLista(TiendaStruct item) => lista.add(item);
  void removeFromLista(TiendaStruct item) => lista.remove(item);
  void removeAtIndexFromLista(int index) => lista.removeAt(index);
  void insertAtIndexInLista(int index, TiendaStruct item) =>
      lista.insert(index, item);
  void updateListaAtIndex(int index, Function(TiendaStruct) updateFn) =>
      lista[index] = updateFn(lista[index]);

  int? indice = 0;

  bool? cargando = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - ubicacionSiPermitida] action in StoreLocatorMap widget.
  LatLng? loc;
  // State field(s) for Map Google Map widget.
  LatLng? mapGoogleMapsCenter;
  final mapGoogleMapsController = Completer<GoogleMapController>();
  // State field(s) for buscarInput widget.
  FocusNode? buscarInputFocusNode;
  TextEditingController? buscarInputTextController;
  String? Function(BuildContext, String?)? buscarInputTextControllerValidator;
  // Stores action output result for [Custom Action - ubicacionSiPermitida] action in Container widget.
  LatLng? nueva;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for BarraInferior.
  late BarraInferiorModel barraInferiorModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
    barraInferiorModel = createModel(context, () => BarraInferiorModel());
  }

  @override
  void dispose() {
    buscarInputFocusNode?.dispose();
    buscarInputTextController?.dispose();

    buttonModel.dispose();
    barraInferiorModel.dispose();
  }
}
