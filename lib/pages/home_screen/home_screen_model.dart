import '/components/barra_inferior_widget.dart';
import '/components/button/button_widget.dart';
import '/components/header_row/header_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderRow.
  late HeaderRowModel headerRowModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for BarraInferior.
  late BarraInferiorModel barraInferiorModel;

  @override
  void initState(BuildContext context) {
    headerRowModel = createModel(context, () => HeaderRowModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    barraInferiorModel = createModel(context, () => BarraInferiorModel());
  }

  @override
  void dispose() {
    headerRowModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    barraInferiorModel.dispose();
  }
}
