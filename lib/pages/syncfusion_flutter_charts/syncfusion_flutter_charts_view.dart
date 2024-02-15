import 'package:base_flutter/helpers/base/ui/base_stateful_view.dart';
import 'package:base_flutter/pages/syncfusion_flutter_charts/syncfusion_flutter_charts_view_model.dart';
import 'package:base_flutter/pages/syncfusion_flutter_charts/widgets/board_widget.dart';
import 'package:base_flutter/pages/syncfusion_flutter_charts/widgets/syncfusion_flutter_charts_widget.dart';
import 'package:base_flutter/pages/syncfusion_flutter_charts/widgets/y_axis_widget.dart';
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
    return Row(
      children: [
        const YAxisWidget(),
        Expanded(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {

                  final maxHeight = constraints.maxHeight;
                  final bgWidth = (maxHeight - 40) * 1831 / 461;
                  final itemWidth =
                      (bgWidth - 7) / 6 / 12;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Expanded(child: Stack(
                          fit: StackFit.loose,
                          children: [
                            /*Obx(() => */AspectRatio(
                              aspectRatio: 1831 / 461,
                              child: Image.asset(
                                /* viewModel.typeAge.value ==
                                    GrowAgeType.less6years
                                    ? */'assets/images/bg_growth_0_6_years.png',
                                // : viewModel.typeAge.value ==
                                // GrowAgeType.less12years
                                // ? 'assets/images/png/bg_growth_6_12_years.png'
                                // : 'assets/images/png/bg_growth_12_18_years.png',
                                fit: BoxFit.fill,
                              ),
                            ),

                            const SyncFusionFlutterChartsWidget()
                          ],
                        )),
                        BoardWidget(itemWith: itemWidth,)
                      ],
                    ),
                  );
                })
        ),
        const YAxisWidget(),
      ],
    );
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
