import 'package:base_flutter/helpers/base/ui/base_stateful_view.dart';
import 'package:base_flutter/pages/syncfusion_flutter_charts/syncfusion_flutter_charts_view_model.dart';
import 'package:base_flutter/pages/syncfusion_flutter_charts/widgets/syncfusion_flutter_charts_widget.dart';
import 'package:base_flutter/pages/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SyncfusionFlutterChartsView extends StatefulWidget {
  static const route = "/SyncfusionFlutterChartsView";

  const SyncfusionFlutterChartsView({super.key});

  @override
  State<StatefulWidget> createState() => SyncfusionFlutterChartsViewState();
}

class SyncfusionFlutterChartsViewState extends BaseStateOfView<
    SyncfusionFlutterChartsView, SyncfusionFlutterChartsViewModel> {
  @override
  Widget buildBody(BuildContext context) {
    return const SyncFusionFlutterChartsWidget();
  }

  @override
  SyncfusionFlutterChartsViewModel createViewModel() {
    return SyncfusionFlutterChartsViewModel();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBarWidget(
      context: context,
      title: "Syncfusion Flutter Charts",
    );
  }
}
