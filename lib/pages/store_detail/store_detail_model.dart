import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'store_detail_widget.dart' show StoreDetailWidget;
import 'package:flutter/material.dart';

class StoreDetailModel extends FlutterFlowModel<StoreDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for Button.
  late ButtonModel buttonModel3;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
  }
}
